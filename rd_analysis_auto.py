# rd_analysis.py
import subprocess
import os
import re
import json
from pathlib import Path
from collections import defaultdict

class RDAnalyzer:
    def __init__(self, llvm_build_dir="/Users/jangjaehyeok/Desktop/LLVM/build"):
        self.build_dir = Path(llvm_build_dir)
        self.plugin_path = self.build_dir / "libReusePass.dylib"
        
    def c_to_ir(self, c_file):
        """C 파일을 LLVM IR로 변환"""
        ir_file = Path(c_file).with_suffix('.ll')
        cmd = [
            'clang', '-O0', '-Xclang', '-disable-O0-optnone', 
            '-g', '-emit-llvm', '-S', str(c_file), '-o', str(ir_file)
        ]
        subprocess.run(cmd, check=True)
        return ir_file
    
    def run_reuse_pass(self, ir_file):
        """ReusePass 실행하여 RD 데이터 추출"""
        
        ir_file_abs = Path(ir_file).resolve()
        cmd = [
            'opt', '-load-pass-plugin', str(self.plugin_path),
            '-passes=function(reuse-pass)', str(ir_file_abs), '-disable-output'
        ]
        result = subprocess.run(cmd, capture_output=True, text=True, cwd=self.build_dir)
        return result.stderr  # RD 정보는 stderr로 출력됨
    
    def parse_rd_output(self, output):
        """RD 출력 파싱하여 메모리 주소별로 그룹화"""
        rd_data = defaultdict(list)
        
        for line in output.strip().split('\n'):
            if 'RD(mem-accesses)=' in line:
                # 정규식으로 파싱
                match = re.search(r'RD\(mem-accesses\)=(\d+).*base=([^\s]+).*off=(\d+)', line)
                if match:
                    original_rd = int(match.group(1))
                    adjusted_rd = original_rd + 1  # RD 값을 1씩 증가
                    base = match.group(2)
                    offset = int(match.group(3))
                    key = f"{base}+{offset}"
                    rd_data[key].append(adjusted_rd)
        
        return rd_data
    
    def calculate_averages(self, rd_data):
        """메모리 주소별 RD 평균 계산"""
        averages = {}
        for addr, rd_values in rd_data.items():
            if rd_values:
                avg = sum(rd_values) / len(rd_values)
                averages[addr] = round(avg, 2)  # 소수점 2번째 자리까지 반올림
        return averages
    
    def analyze_file(self, c_file):
        """단일 C 파일 전체 분석"""
        print(f"분석 중: {c_file}")
        
        # 1. C → IR 변환
        ir_file = self.c_to_ir(c_file)
        print(f"IR 파일 생성: {ir_file}")
        
        # 2. ReusePass 실행
        rd_output = self.run_reuse_pass(ir_file)
        print(f"ReusePass 출력 길이: {len(rd_output)}")
        print(f"ReusePass 출력 내용:\n{rd_output}")
        
        # 3. 결과 파싱
        rd_data = self.parse_rd_output(rd_output)
        print(f"파싱된 RD 데이터: {dict(rd_data)}")
        
        # 4. 평균 계산
        averages = self.calculate_averages(rd_data)
        print(f"계산된 평균: {averages}")
        
        return {
            'file': str(c_file),
            'raw_data': rd_data,
            'averages': averages
        }
    
    def batch_analyze(self, c_files):
        """여러 C 파일 일괄 분석"""
        results = []
        for c_file in c_files:
            try:
                result = self.analyze_file(c_file)
                results.append(result)
            except Exception as e:
                print(f"오류: {c_file} - {e}")
        
        return results
    
    def generate_report(self, results, output_file="rd_analysis_report.json"):
        """분석 결과를 JSON으로 저장"""
        with open(output_file, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"결과 저장: {output_file}")

# 사용 예시
if __name__ == "__main__":
    analyzer = RDAnalyzer()
    
    # 단일 파일 분석
    # result = analyzer.analyze_file("test.c")
    import glob
    c_files = glob.glob("tasks/*.c")
    
    if c_files:
        print(f"발견된 C 파일들: {c_files}")
        results = analyzer.batch_analyze(c_files)
        analyzer.generate_report(results)
    else:
        print("분석할 .c 파일이 없습니다.")

#include <stdio.h>
#include <stdlib.h>

#define MAX_STUDENTS 10
#define NUM_SUBJECTS 3

// 학생 성적 관리 시스템
int main() {
    // 학생 이름 배열
    char student_names[MAX_STUDENTS][20] = {
        "김철수", "이영희", "박민수", "최지영", "정현우",
        "한소영", "강동현", "윤서연", "임태호", "조미래"
    };
    
    // 성적 배열 (학생별 3과목 점수)
    int scores[MAX_STUDENTS][NUM_SUBJECTS] = {
        {85, 92, 78}, {90, 88, 95}, {76, 84, 89},
        {92, 96, 88}, {83, 79, 91}, {88, 85, 87},
        {95, 90, 93}, {81, 87, 82}, {89, 91, 86}, {87, 83, 90}
    };
    
    // 과목명 배열
    char subjects[NUM_SUBJECTS][15] = {"수학", "영어", "과학"};
    
    // 각 학생의 평균 점수 배열
    float averages[MAX_STUDENTS];
    
    printf("=== 학생 성적 관리 시스템 ===\n\n");
    
    // 1. 모든 학생의 성적 출력
    printf("1. 전체 학생 성적표:\n");
    printf("%-10s %-8s %-8s %-8s %-8s\n", "이름", "수학", "영어", "과학", "평균");
    printf("----------------------------------------\n");
    
    for (int i = 0; i < MAX_STUDENTS; i++) {
        // 평균 계산
        float sum = 0;
        for (int j = 0; j < NUM_SUBJECTS; j++) {
            sum += scores[i][j];
        }
        averages[i] = sum / NUM_SUBJECTS;
        
        printf("%-10s %-8d %-8d %-8d %-8.1f\n", 
               student_names[i], scores[i][0], scores[i][1], scores[i][2], averages[i]);
    }
    
    // 2. 과목별 평균 점수 계산
    printf("\n2. 과목별 평균 점수:\n");
    for (int j = 0; j < NUM_SUBJECTS; j++) {
        float subject_sum = 0;
        for (int i = 0; i < MAX_STUDENTS; i++) {
            subject_sum += scores[i][j];
        }
        float subject_avg = subject_sum / MAX_STUDENTS;
        printf("%-8s: %.1f점\n", subjects[j], subject_avg);
    }
    
    // 3. 최고점과 최저점 학생 찾기
    int max_idx = 0, min_idx = 0;
    for (int i = 1; i < MAX_STUDENTS; i++) {
        if (averages[i] > averages[max_idx]) {
            max_idx = i;
        }
        if (averages[i] < averages[min_idx]) {
            min_idx = i;
        }
    }
    
    printf("\n3. 성적 분석:\n");
    printf("최고점 학생: %s (%.1f점)\n", student_names[max_idx], averages[max_idx]);
    printf("최저점 학생: %s (%.1f점)\n", student_names[min_idx], averages[min_idx]);
    
    // 4. 90점 이상 학생 찾기
    printf("\n4. 90점 이상 학생 목록:\n");
    int high_achievers[MAX_STUDENTS];
    int count = 0;
    
    for (int i = 0; i < MAX_STUDENTS; i++) {
        if (averages[i] >= 90.0) {
            high_achievers[count] = i;
            count++;
        }
    }
    
    if (count > 0) {
        for (int i = 0; i < count; i++) {
            int idx = high_achievers[i];
            printf("- %s: %.1f점\n", student_names[idx], averages[idx]);
        }
    } else {
        printf("90점 이상 학생이 없습니다.\n");
    }
    
    // 5. 배열 정렬 (평균 점수 기준 내림차순)
    printf("\n5. 평균 점수 순위 (내림차순):\n");
    int sorted_indices[MAX_STUDENTS];
    for (int i = 0; i < MAX_STUDENTS; i++) {
        sorted_indices[i] = i;
    }
    
    // 버블 정렬로 인덱스 정렬
    for (int i = 0; i < MAX_STUDENTS - 1; i++) {
        for (int j = 0; j < MAX_STUDENTS - 1 - i; j++) {
            if (averages[sorted_indices[j]] < averages[sorted_indices[j + 1]]) {
                int temp = sorted_indices[j];
                sorted_indices[j] = sorted_indices[j + 1];
                sorted_indices[j + 1] = temp;
            }
        }
    }
    
    for (int i = 0; i < MAX_STUDENTS; i++) {
        int idx = sorted_indices[i];
        printf("%d등: %s (%.1f점)\n", i + 1, student_names[idx], averages[idx]);
    }
    
    return 0;
}

#include "task3.h"

// 버블 정렬 함수 - 배열의 메모리 접근 패턴을 보여줌
void bubble_sort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
                // 스왑 연산 - 인접한 배열 요소들의 메모리 접근
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

// 행렬 곱셈 - 2차원 배열의 메모리 접근 패턴
void matrix_multiply(int a[MATRIX_SIZE][MATRIX_SIZE], int b[MATRIX_SIZE][MATRIX_SIZE], int result[MATRIX_SIZE][MATRIX_SIZE]) {
    for (int i = 0; i < MATRIX_SIZE; i++) {
        for (int j = 0; j < MATRIX_SIZE; j++) {
            result[i][j] = 0;
            for (int k = 0; k < MATRIX_SIZE; k++) {
                result[i][j] += a[i][k] * b[k][j];
            }
        }
    }
}

int main() {
    // 1. 버블 정렬 수행
    int arr[] = {64, 34, 25, 12, 22, 11, 90, 5, 77, 30};
    int n = sizeof(arr) / sizeof(arr[0]);
    bubble_sort(arr, n);
    
    // 2. 행렬 곱셈 수행
    int matrix_a[MATRIX_SIZE][MATRIX_SIZE];
    int matrix_b[MATRIX_SIZE][MATRIX_SIZE];
    int matrix_result[MATRIX_SIZE][MATRIX_SIZE];
    
    // 행렬 초기화
    for (int i = 0; i < MATRIX_SIZE; i++) {
        for (int j = 0; j < MATRIX_SIZE; j++) {
            matrix_a[i][j] = i + j;
            matrix_b[i][j] = i * j;
        }
    }
    
    matrix_multiply(matrix_a, matrix_b, matrix_result);
    
    return 0;
}

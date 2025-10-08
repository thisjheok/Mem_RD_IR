#ifndef TASK3_H
#define TASK3_H

#include <stdio.h>
#include <stdlib.h>

#define MAX_SIZE 100
#define MATRIX_SIZE 10

// 함수 선언
void bubble_sort(int arr[], int n);
void matrix_multiply(int a[MATRIX_SIZE][MATRIX_SIZE], int b[MATRIX_SIZE][MATRIX_SIZE], int result[MATRIX_SIZE][MATRIX_SIZE]);
void array_operations(int arr[], int n);
void fibonacci_array(int arr[], int n);
void search_and_replace(int arr[], int n, int old_val, int new_val);

#endif

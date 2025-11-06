int example1() {
    int arr[10];
    // char arr2[10];

    for(int i=0;i<10;i++){
        arr[i] +=1;
    }

    return arr[0]+arr[1]+arr[2]+arr[3]+arr[4]+arr[5]+arr[6]+arr[7]+arr[8]+arr[9];
}

int main() {
    int result = example1();
    printf("result: %d\n", result);
    return 0;
}
int example1() {
    int arr[100];
    int sum = 0;
    
    arr[0] = 10;      
    arr[1] = 20;     
    sum = arr[0];     
    arr[2] = 30;     
    sum += arr[1];     
    arr[0] = sum;       
    
    return sum;
}
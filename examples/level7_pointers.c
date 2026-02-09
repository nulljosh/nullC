// Level 7: Pointers and arrays
int main() {
    int arr[5];
    arr[0] = 10;
    arr[1] = 20;
    arr[2] = 30;
    arr[3] = 40;
    arr[4] = 50;
    
    int *ptr = arr;
    int sum = 0;
    
    for (int i = 0; i < 5; i = i + 1) {
        sum = sum + ptr[i];
    }
    
    return sum;
}

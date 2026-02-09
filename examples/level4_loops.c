// Level 4: For and while loops
int main() {
    int sum = 0;
    
    // For loop
    for (int i = 0; i < 10; i = i + 1) {
        sum = sum + i;
    }
    
    // While loop
    int j = 0;
    while (j < 5) {
        sum = sum + j;
        j = j + 1;
    }
    
    return sum;
}

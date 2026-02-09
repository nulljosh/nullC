// Level 5: Function definitions and calls
int add(int a, int b) {
    return a + b;
}

int multiply(int x, int y) {
    int result = 0;
    for (int i = 0; i < y; i = i + 1) {
        result = add(result, x);
    }
    return result;
}

int main() {
    int x = add(5, 10);
    int y = multiply(3, 4);
    return add(x, y);
}

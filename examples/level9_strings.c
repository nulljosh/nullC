// Level 9: String manipulation and file-like operations
int string_length(char *str) {
    int len = 0;
    while (str[len] != 0) {
        len = len + 1;
    }
    return len;
}

int string_compare(char *s1, char *s2) {
    int i = 0;
    while (s1[i] != 0 && s2[i] != 0) {
        if (s1[i] != s2[i]) {
            return 0;
        }
        i = i + 1;
    }
    return s1[i] == s2[i];
}

void string_copy(char *dest, char *src) {
    int i = 0;
    while (src[i] != 0) {
        dest[i] = src[i];
        i = i + 1;
    }
    dest[i] = 0;
}

int main() {
    char msg[20];
    char *hello = "Hello";
    
    string_copy(msg, hello);
    int len = string_length(msg);
    int same = string_compare(msg, "Hello");
    
    return len + same;
}

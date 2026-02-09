// Level 10: Mini lexer/tokenizer (compiler writing a compiler!)
enum TokenType {
    TOKEN_NUMBER,
    TOKEN_PLUS,
    TOKEN_MINUS,
    TOKEN_STAR,
    TOKEN_SLASH,
    TOKEN_EOF
};

struct Token {
    enum TokenType type;
    int value;
};

int is_digit(char c) {
    return c >= '0' && c <= '9';
}

struct Token next_token(char *source, int *pos) {
    struct Token tok;
    
    // Skip whitespace
    while (source[*pos] == ' ' || source[*pos] == '\t') {
        *pos = *pos + 1;
    }
    
    char c = source[*pos];
    
    if (c == 0) {
        tok.type = TOKEN_EOF;
        return tok;
    }
    
    if (is_digit(c)) {
        tok.type = TOKEN_NUMBER;
        tok.value = 0;
        while (is_digit(source[*pos])) {
            tok.value = tok.value * 10 + (source[*pos] - '0');
            *pos = *pos + 1;
        }
        return tok;
    }
    
    *pos = *pos + 1;
    
    if (c == '+') tok.type = TOKEN_PLUS;
    else if (c == '-') tok.type = TOKEN_MINUS;
    else if (c == '*') tok.type = TOKEN_STAR;
    else if (c == '/') tok.type = TOKEN_SLASH;
    
    return tok;
}

int evaluate(char *expr) {
    int pos = 0;
    struct Token tok = next_token(expr, &pos);
    int result = tok.value;
    
    while (1) {
        tok = next_token(expr, &pos);
        if (tok.type == TOKEN_EOF) break;
        
        enum TokenType op = tok.type;
        tok = next_token(expr, &pos);
        int operand = tok.value;
        
        if (op == TOKEN_PLUS) result = result + operand;
        else if (op == TOKEN_MINUS) result = result - operand;
        else if (op == TOKEN_STAR) result = result * operand;
        else if (op == TOKEN_SLASH) result = result / operand;
    }
    
    return result;
}

int main() {
    char expr[20];
    expr[0] = '1';
    expr[1] = '0';
    expr[2] = ' ';
    expr[3] = '+';
    expr[4] = ' ';
    expr[5] = '5';
    expr[6] = ' ';
    expr[7] = '*';
    expr[8] = ' ';
    expr[9] = '2';
    expr[10] = 0;
    
    // Evaluates "10 + 5 * 2" = 20 (left-to-right, no precedence)
    return evaluate(expr);
}

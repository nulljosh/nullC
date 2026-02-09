#include <stdio.h>
#include <stdlib.h>
#include "lexer.h"

char* read_file(const char *filename) {
    FILE *f = fopen(filename, "rb");
    if (!f) {
        fprintf(stderr, "Error: Cannot open file '%s'\n", filename);
        return NULL;
    }
    
    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    fseek(f, 0, SEEK_SET);
    
    char *buffer = malloc(size + 1);
    fread(buffer, 1, size, f);
    buffer[size] = '\0';
    
    fclose(f);
    return buffer;
}

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <file.c>\n", argv[0]);
        return 1;
    }
    
    char *source = read_file(argv[1]);
    if (!source) return 1;
    
    printf("=== Tokenizing: %s ===\n\n", argv[1]);
    
    Lexer lexer;
    lexer_init(&lexer, source);
    
    Token token;
    do {
        token = lexer_next_token(&lexer);
        printf("[%d:%d] %-12s '%s'\n", 
               token.line, token.column,
               token_type_str(token.type), 
               token.value);
        
        if (token.type != TOKEN_EOF) {
            token_free(&token);
        }
    } while (token.type != TOKEN_EOF);
    
    token_free(&token);
    free(source);
    
    return 0;
}

#include <stdio.h>
#include <stdlib.h>
#include "lexer.h"
#include "parser.h"
#include "ast.h"

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
    
    // Tokenize
    Lexer lexer;
    lexer_init(&lexer, source);
    
    Token tokens[1000];  // Fixed buffer for now
    int token_count = 0;
    
    Token token;
    do {
        token = lexer_next_token(&lexer);
        tokens[token_count++] = token;
    } while (token.type != TOKEN_EOF && token_count < 1000);
    
    // Parse
    printf("=== Parsing: %s ===\n\n", argv[1]);
    
    Parser parser;
    parser_init(&parser, tokens, token_count);
    
    ASTNode *ast = parse_program(&parser);
    
    // Print AST
    printf("=== AST ===\n\n");
    ast_print(ast, 0);
    
    // Cleanup
    ast_free(ast);
    for (int i = 0; i < token_count; i++) {
        token_free(&tokens[i]);
    }
    free(source);
    
    return 0;
}

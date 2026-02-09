#include "parser.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

static Token* peek(Parser *p) {
    if (p->pos >= p->token_count) return NULL;
    return &p->tokens[p->pos];
}

static Token* advance(Parser *p) {
    if (p->pos >= p->token_count) return NULL;
    return &p->tokens[p->pos++];
}

static int match(Parser *p, TokenType type) {
    Token *t = peek(p);
    return t && t->type == type;
}

static int match_value(Parser *p, const char *value) {
    Token *t = peek(p);
    return t && strcmp(t->value, value) == 0;
}

static Token* expect(Parser *p, TokenType type, const char *msg) {
    Token *t = advance(p);
    if (!t || t->type != type) {
        fprintf(stderr, "Parse error: %s\n", msg);
        exit(1);
    }
    return t;
}

// Forward declarations
static ASTNode* parse_expression(Parser *p);
static ASTNode* parse_statement(Parser *p);

// Primary: number | identifier
static ASTNode* parse_primary(Parser *p) {
    Token *t = peek(p);
    
    if (match(p, TOKEN_NUMBER)) {
        advance(p);
        return ast_create_number(atoi(t->value));
    }
    
    if (match(p, TOKEN_IDENTIFIER)) {
        advance(p);
        return ast_create_identifier(t->value);
    }
    
    if (match_value(p, "(")) {
        advance(p);  // (
        ASTNode *expr = parse_expression(p);
        expect(p, TOKEN_SEPARATOR, "Expected ')' after expression");
        return expr;
    }
    
    fprintf(stderr, "Parse error: unexpected token '%s'\n", t ? t->value : "EOF");
    exit(1);
}

// Multiplicative: primary ((*|/) primary)*
static ASTNode* parse_multiplicative(Parser *p) {
    ASTNode *left = parse_primary(p);
    
    while (match_value(p, "*") || match_value(p, "/")) {
        char op = peek(p)->value[0];
        advance(p);
        ASTNode *right = parse_primary(p);
        left = ast_create_binary_op(op, left, right);
    }
    
    return left;
}

// Additive: multiplicative ((+|-) multiplicative)*
static ASTNode* parse_additive(Parser *p) {
    ASTNode *left = parse_multiplicative(p);
    
    while (match_value(p, "+") || match_value(p, "-")) {
        char op = peek(p)->value[0];
        advance(p);
        ASTNode *right = parse_multiplicative(p);
        left = ast_create_binary_op(op, left, right);
    }
    
    return left;
}

// Assignment: identifier = expression
static ASTNode* parse_assignment(Parser *p, Token *ident) {
    advance(p);  // =
    ASTNode *value = parse_expression(p);
    return ast_create_assignment(ident->value, value);
}

// Expression: additive
static ASTNode* parse_expression(Parser *p) {
    return parse_additive(p);
}

// Return statement: return expression;
static ASTNode* parse_return(Parser *p) {
    advance(p);  // return
    ASTNode *value = parse_expression(p);
    expect(p, TOKEN_SEPARATOR, "Expected ';' after return");
    return ast_create_return(value);
}

// Variable declaration: type identifier (= expression)?;
static ASTNode* parse_var_decl(Parser *p, Token *type_tok) {
    Token *name = expect(p, TOKEN_IDENTIFIER, "Expected variable name");
    ASTNode *init = NULL;
    
    if (match_value(p, "=")) {
        advance(p);
        init = parse_expression(p);
    }
    
    expect(p, TOKEN_SEPARATOR, "Expected ';' after declaration");
    return ast_create_var_decl(name->value, type_tok->value, init);
}

// Statement: return | var_decl | assignment
static ASTNode* parse_statement(Parser *p) {
    Token *t = peek(p);
    
    // return statement
    if (match_value(p, "return")) {
        return parse_return(p);
    }
    
    // Type keyword (int, void, etc.)
    if (match(p, TOKEN_KEYWORD)) {
        return parse_var_decl(p, advance(p));
    }
    
    // Assignment: identifier = expr;
    if (match(p, TOKEN_IDENTIFIER)) {
        Token *ident = advance(p);
        if (match_value(p, "=")) {
            ASTNode *assign = parse_assignment(p, ident);
            expect(p, TOKEN_SEPARATOR, "Expected ';' after assignment");
            return assign;
        }
        // Just an expression statement (not yet supported)
        p->pos--;  // backtrack
    }
    
    fprintf(stderr, "Parse error: unexpected statement starting with '%s'\n", t->value);
    exit(1);
}

// Block: { statement* }
static ASTNode* parse_block(Parser *p) {
    expect(p, TOKEN_SEPARATOR, "Expected '{'");
    
    ASTNode *block = ast_create_block();
    
    while (!match_value(p, "}")) {
        ASTNode *stmt = parse_statement(p);
        ast_add_statement(block, stmt);
    }
    
    expect(p, TOKEN_SEPARATOR, "Expected '}'");
    return block;
}

// Function: type identifier() block
static ASTNode* parse_function(Parser *p) {
    Token *return_type = expect(p, TOKEN_KEYWORD, "Expected return type");
    Token *name = expect(p, TOKEN_IDENTIFIER, "Expected function name");
    expect(p, TOKEN_SEPARATOR, "Expected '('");
    expect(p, TOKEN_SEPARATOR, "Expected ')'");
    
    ASTNode *body = parse_block(p);
    return ast_create_function(name->value, return_type->value, body);
}

// Program: function*
ASTNode* parse_program(Parser *p) {
    ASTNode *program = ast_create_program();
    
    while (peek(p) && !match(p, TOKEN_EOF)) {
        ASTNode *func = parse_function(p);
        ast_add_function(program, func);
    }
    
    return program;
}

void parser_init(Parser *parser, Token *tokens, int count) {
    parser->tokens = tokens;
    parser->token_count = count;
    parser->pos = 0;
}

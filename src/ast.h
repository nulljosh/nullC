#ifndef AST_H
#define AST_H

typedef enum {
    AST_PROGRAM,
    AST_FUNCTION,
    AST_BLOCK,
    AST_RETURN,
    AST_IF,
    AST_WHILE,
    AST_FOR,
    AST_VAR_DECL,
    AST_ASSIGN,
    AST_BINARY_OP,
    AST_NUMBER,
    AST_IDENTIFIER,
    AST_CALL
} ASTNodeType;

typedef struct ASTNode {
    ASTNodeType type;
    union {
        struct {
            struct ASTNode **functions;
            int function_count;
        } program;
        
        struct {
            char *name;
            char *return_type;
            struct ASTNode *body;
        } function;
        
        struct {
            struct ASTNode **statements;
            int statement_count;
        } block;
        
        struct {
            struct ASTNode *value;
        } return_stmt;
        
        struct {
            char *name;
            char *var_type;
            struct ASTNode *init;
        } var_decl;
        
        struct {
            char *name;
            struct ASTNode *value;
        } assignment;
        
        struct {
            char op;
            struct ASTNode *left;
            struct ASTNode *right;
        } binary_op;
        
        struct {
            int value;
        } number;
        
        struct {
            char *name;
        } identifier;
    } data;
} ASTNode;

ASTNode* ast_create_program(void);
ASTNode* ast_create_function(char *name, char *return_type, ASTNode *body);
ASTNode* ast_create_block(void);
ASTNode* ast_create_return(ASTNode *value);
ASTNode* ast_create_var_decl(char *name, char *type, ASTNode *init);
ASTNode* ast_create_assignment(char *name, ASTNode *value);
ASTNode* ast_create_binary_op(char op, ASTNode *left, ASTNode *right);
ASTNode* ast_create_number(int value);
ASTNode* ast_create_identifier(char *name);

void ast_add_function(ASTNode *program, ASTNode *function);
void ast_add_statement(ASTNode *block, ASTNode *statement);

void ast_print(ASTNode *node, int indent);
void ast_free(ASTNode *node);

#endif // AST_H

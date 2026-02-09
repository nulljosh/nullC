#include "ast.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

ASTNode* ast_create_program(void) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_PROGRAM;
    node->data.program.functions = NULL;
    node->data.program.function_count = 0;
    return node;
}

ASTNode* ast_create_function(char *name, char *return_type, ASTNode *body) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_FUNCTION;
    node->data.function.name = strdup(name);
    node->data.function.return_type = strdup(return_type);
    node->data.function.body = body;
    return node;
}

ASTNode* ast_create_block(void) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_BLOCK;
    node->data.block.statements = NULL;
    node->data.block.statement_count = 0;
    return node;
}

ASTNode* ast_create_return(ASTNode *value) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_RETURN;
    node->data.return_stmt.value = value;
    return node;
}

ASTNode* ast_create_var_decl(char *name, char *type, ASTNode *init) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_VAR_DECL;
    node->data.var_decl.name = strdup(name);
    node->data.var_decl.var_type = strdup(type);
    node->data.var_decl.init = init;
    return node;
}

ASTNode* ast_create_assignment(char *name, ASTNode *value) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_ASSIGN;
    node->data.assignment.name = strdup(name);
    node->data.assignment.value = value;
    return node;
}

ASTNode* ast_create_binary_op(char op, ASTNode *left, ASTNode *right) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_BINARY_OP;
    node->data.binary_op.op = op;
    node->data.binary_op.left = left;
    node->data.binary_op.right = right;
    return node;
}

ASTNode* ast_create_number(int value) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_NUMBER;
    node->data.number.value = value;
    return node;
}

ASTNode* ast_create_identifier(char *name) {
    ASTNode *node = calloc(1, sizeof(ASTNode));
    node->type = AST_IDENTIFIER;
    node->data.identifier.name = strdup(name);
    return node;
}

void ast_add_function(ASTNode *program, ASTNode *function) {
    int new_count = program->data.program.function_count + 1;
    program->data.program.functions = realloc(
        program->data.program.functions,
        sizeof(ASTNode*) * new_count
    );
    program->data.program.functions[program->data.program.function_count] = function;
    program->data.program.function_count = new_count;
}

void ast_add_statement(ASTNode *block, ASTNode *statement) {
    int new_count = block->data.block.statement_count + 1;
    block->data.block.statements = realloc(
        block->data.block.statements,
        sizeof(ASTNode*) * new_count
    );
    block->data.block.statements[block->data.block.statement_count] = statement;
    block->data.block.statement_count = new_count;
}

static void print_indent(int indent) {
    for (int i = 0; i < indent; i++) printf("  ");
}

void ast_print(ASTNode *node, int indent) {
    if (!node) return;
    
    print_indent(indent);
    
    switch (node->type) {
        case AST_PROGRAM:
            printf("Program\n");
            for (int i = 0; i < node->data.program.function_count; i++) {
                ast_print(node->data.program.functions[i], indent + 1);
            }
            break;
            
        case AST_FUNCTION:
            printf("Function: %s() -> %s\n",
                   node->data.function.name,
                   node->data.function.return_type);
            ast_print(node->data.function.body, indent + 1);
            break;
            
        case AST_BLOCK:
            printf("Block\n");
            for (int i = 0; i < node->data.block.statement_count; i++) {
                ast_print(node->data.block.statements[i], indent + 1);
            }
            break;
            
        case AST_RETURN:
            printf("Return\n");
            ast_print(node->data.return_stmt.value, indent + 1);
            break;
            
        case AST_VAR_DECL:
            printf("VarDecl: %s %s\n",
                   node->data.var_decl.var_type,
                   node->data.var_decl.name);
            if (node->data.var_decl.init) {
                ast_print(node->data.var_decl.init, indent + 1);
            }
            break;
            
        case AST_ASSIGN:
            printf("Assign: %s =\n", node->data.assignment.name);
            ast_print(node->data.assignment.value, indent + 1);
            break;
            
        case AST_BINARY_OP:
            printf("BinaryOp: %c\n", node->data.binary_op.op);
            ast_print(node->data.binary_op.left, indent + 1);
            ast_print(node->data.binary_op.right, indent + 1);
            break;
            
        case AST_NUMBER:
            printf("Number: %d\n", node->data.number.value);
            break;
            
        case AST_IDENTIFIER:
            printf("Identifier: %s\n", node->data.identifier.name);
            break;
            
        default:
            printf("Unknown AST node\n");
    }
}

void ast_free(ASTNode *node) {
    if (!node) return;
    
    switch (node->type) {
        case AST_PROGRAM:
            for (int i = 0; i < node->data.program.function_count; i++) {
                ast_free(node->data.program.functions[i]);
            }
            free(node->data.program.functions);
            break;
            
        case AST_FUNCTION:
            free(node->data.function.name);
            free(node->data.function.return_type);
            ast_free(node->data.function.body);
            break;
            
        case AST_BLOCK:
            for (int i = 0; i < node->data.block.statement_count; i++) {
                ast_free(node->data.block.statements[i]);
            }
            free(node->data.block.statements);
            break;
            
        case AST_RETURN:
            ast_free(node->data.return_stmt.value);
            break;
            
        case AST_VAR_DECL:
            free(node->data.var_decl.name);
            free(node->data.var_decl.var_type);
            ast_free(node->data.var_decl.init);
            break;
            
        case AST_ASSIGN:
            free(node->data.assignment.name);
            ast_free(node->data.assignment.value);
            break;
            
        case AST_BINARY_OP:
            ast_free(node->data.binary_op.left);
            ast_free(node->data.binary_op.right);
            break;
            
        case AST_IDENTIFIER:
            free(node->data.identifier.name);
            break;
            
        default:
            break;
    }
    
    free(node);
}

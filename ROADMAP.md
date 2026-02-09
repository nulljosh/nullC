# nullC Development Roadmap

## Complexity Levels (Test Suite)

### Level 0: Hello World
- Empty main function returning 0
- **Status**: ✅ Lexer passes

### Level 1: Arithmetic
- Basic math operations (+, -, *, /)
- **Status**: ✅ Lexer passes

### Level 2: Variables
- Variable declarations and assignments
- Expression evaluation
- **Status**: ✅ Lexer passes

### Level 3: Conditionals
- if/else statements
- Comparison operators
- **Status**: ✅ Lexer passes

### Level 4: Loops
- for and while loops
- Loop control flow
- **Status**: ✅ Lexer passes

### Level 5: Functions
- Function definitions
- Function calls with parameters
- Return values
- **Status**: ✅ Lexer passes

### Level 6: Recursion
- Recursive function calls
- factorial, fibonacci examples
- **Status**: ✅ Lexer passes

### Level 7: Pointers & Arrays
- Array indexing
- Pointer arithmetic
- **Status**: ✅ Lexer passes

### Level 8: Structs
- Struct definitions
- Nested structs
- Member access
- **Status**: ✅ Lexer passes

### Level 9: Strings
- String manipulation
- Character arrays
- String functions
- **Status**: ✅ Lexer passes

### Level 10: Meta-Compiler
- Tokenizer written in C
- Expression evaluator
- Compiler writing a compiler!
- **Status**: ✅ Lexer passes

## Implementation Phases

### Phase 1: Lexer ✅
- Tokenize C source
- Recognize keywords, identifiers, numbers, operators
- Handle whitespace and newlines

### Phase 2: Parser (Next)
- Build Abstract Syntax Tree (AST)
- Handle expressions, statements, declarations
- Operator precedence

### Phase 3: Semantic Analysis
- Type checking
- Symbol table
- Scope resolution

### Phase 4: Code Generation
- Generate x86-64 assembly
- Register allocation
- Function calling conventions

### Phase 5: Optimization
- Constant folding
- Dead code elimination
- Basic peephole optimizations

## Goal
Compile all 10 complexity levels from C source → working binaries

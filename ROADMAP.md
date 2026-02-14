# nullC Development Roadmap

## Complexity Levels (Test Suite)

### Level 0: Hello World
- Empty main function returning 0
- **Status**: ✓ Compiles and runs

### Level 1: Arithmetic
- Basic math operations (+, -, *, /)
- **Status**: ✓ Returns 48

### Level 2: Variables
- Variable declarations and assignments
- Expression evaluation
- **Status**: ✓ Returns 115

### Level 3: Conditionals
- if/else statements
- Comparison operators
- **Status**: ✓ Returns 2

### Level 4: Loops
- for and while loops
- Loop control flow
- **Status**: ✓ Returns 55

### Level 5: Functions
- Function definitions
- Function calls with parameters
- Return values
- **Status**: ✓ Returns 27

### Level 6: Recursion
- Recursive function calls
- factorial, fibonacci examples
- **Status**: ✓ Returns 133

### Level 7: Pointers & Arrays
- Array indexing
- Pointer arithmetic
- **Status**: ✓ Compiles successfully

### Level 8: Structs
- Struct definitions
- Nested structs
- Member access
- **Status**: ✓ Returns 50 (correct)

### Level 9: Strings
- String manipulation
- Character arrays
- String functions
- **Status**: ✓ Compiles successfully

### Level 10: Meta-Compiler
- Tokenizer written in C
- Expression evaluator
- Compiler writing a compiler!
- **Status**: ✓ Compiles successfully

## Implementation Phases

### Phase 1: Lexer [DONE]
- Tokenize C source
- Recognize keywords, identifiers, numbers, operators
- Handle whitespace and newlines

### Phase 2: Parser [COMPLETE]
- Build Abstract Syntax Tree (AST)
- Handle expressions, statements, declarations
- Operator precedence
- **Status**: Fully functional, all levels parse correctly

### Phase 3: Semantic Analysis [PARTIAL]
- Type checking
- Symbol table (implemented)
- Scope resolution (basic)

### Phase 4: Code Generation [IN PROGRESS]
- Generate ARM64 assembly (Darwin/macOS)
- Register allocation (basic)
- Function calling conventions (AAPCS64)
- **Status**: Levels 0-7, 9-10 compiling and running correctly

### Phase 5: Optimization
- Constant folding
- Dead code elimination
- Basic peephole optimizations

## Goal
Compile all 10 complexity levels from C source → working binaries

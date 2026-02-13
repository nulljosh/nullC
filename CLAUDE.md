# Claude Development Guide

## Project Context
nullC is a C compiler written in C, built incrementally from lexer to full codegen.

## Current State
- Lexer: Complete (tokenizes all 10 complexity levels)
- Parser: Not started
- Codegen: Not started

## Next Milestones

### Milestone 1: Parser Foundation
**Goal**: Parse expressions and statements into AST
**Files**: src/parser.h, src/parser.c, src/ast.h
**Test**: Parse level0_hello.c and level1_arithmetic.c

### Milestone 2: Control Flow Parsing
**Goal**: Handle if/else, loops
**Test**: Parse level3_conditionals.c and level4_loops.c

### Milestone 3: Functions
**Goal**: Parse function definitions and calls
**Test**: Parse level5_functions.c and level6_recursion.c

### Milestone 4: Advanced Types
**Goal**: Pointers, arrays, structs
**Test**: Parse level7-9

### Milestone 5: Code Generation
**Goal**: Emit x86-64 assembly for simple programs
**Test**: Compile and run level0-2

### Milestone 6: Full Compiler
**Goal**: Compile all 10 levels successfully
**Test**: All examples compile and execute correctly

## Development Commands

Build:
```bash
make
```

Test lexer on all levels:
```bash
for f in examples/level*.c; do
  echo "=== $f ==="
  ./nullc "$f"
done
```

Add new feature:
```bash
git add .
git commit -m "feat: <description>"
git push
```

## Code Style
- C99 standard
- Clean, readable code
- Comments for non-obvious logic
- Functions < 50 lines when possible

## Commit Message Format
- feat: New feature
- fix: Bug fix
- refactor: Code restructure
- test: Add/modify tests
- docs: Documentation only

## Notes
- Work incrementally, one milestone at a time
- Test each level as parser evolves
- Focus on correctness over optimization
- Document design decisions in comments
# AGENTS.md - AI Development Guide

## Project Overview
nullC is a C compiler written in C. It's an educational project to understand compiler construction from first principles.

## For AI Agents Working on This Project

### Current Status (2026-02-09)
- Phase 1 (Lexer): COMPLETE
- Phase 2 (Parser): NOT STARTED
- Phase 3-5: NOT STARTED

### Key Files
- `src/lexer.{h,c}` - Tokenization (DONE)
- `src/parser.{h,c}` - AST construction (TODO)
- `src/ast.h` - AST node definitions (TODO)
- `src/codegen.c` - x86-64 assembly generation (TODO)
- `examples/level*.c` - 10 test programs of increasing complexity

### Development Workflow

1. **Read ROADMAP.md** first - understand the 10 complexity levels
2. **Read CLAUDE.md** - see milestones and commit format
3. **Test lexer** on any new examples:
   ```bash
   make
   ./nullc examples/level0_hello.c
   ```
4. **Commit format**: `type: description` (feat/fix/refactor/test/docs)
5. **Push often** - small commits are better

### Next Task: Parser (Milestone 1)

**Goal**: Build AST from tokens

**Files to create**:
- `src/ast.h` - AST node types (Program, Function, Statement, Expression)
- `src/parser.h` - Parser interface
- `src/parser.c` - Recursive descent parser

**Start simple**:
1. Parse `level0_hello.c` (empty main returning int)
2. Then `level1_arithmetic.c` (expressions)
3. Incrementally add complexity

**Test approach**:
```c
// In src/main.c, add after lexer output:
Parser parser;
parser_init(&parser, tokens);
ASTNode *ast = parse_program(&parser);
ast_print(ast);  // Debug output
ast_free(ast);
```

### Design Principles
- **Simplicity over cleverness** - clear code beats terse code
- **Incremental progress** - make it work, then make it better
- **Test each level** - verify parser handles all 10 complexity levels
- **Document surprises** - comment non-obvious design decisions

### Common Pitfalls
- Don't implement optimization early - get it working first
- Parser should build AST, not evaluate or generate code
- Operator precedence matters: handle it in the parser
- Left recursion in grammar will infinite loop - use iteration

### Resources
- ROADMAP.md - full project plan
- CLAUDE.md - milestones and conventions
- examples/ - 10 test programs to support

### Questions to Ask
- Does this parser handle all tokens from the lexer?
- Can it parse all 10 complexity levels?
- Is the AST structure clear and extensible?
- Are error messages helpful for debugging?

### Success Criteria for Next Milestone
- [ ] AST nodes defined for expressions, statements, declarations
- [ ] Parser can handle level0-2 (hello, arithmetic, variables)
- [ ] AST pretty-printer shows tree structure
- [ ] No segfaults or memory leaks (valgrind clean)
- [ ] Committed with message: "feat: implement parser foundation"

---

**Remember**: The goal isn't just a working compiler, it's understanding how compilers work. Code should be readable and educational.
# nullC Benchmarks

## Complexity Tiers

### Tier 1: Basic Programs (Current)
- **Level 0**: Hello World (return 0)
- **Level 1**: Arithmetic (+-*/)
- **Level 2**: Variables and expressions
- **Status**: Parser working 

### Tier 2: Control Flow
- **Level 3**: If/else conditionals
- **Level 4**: While and for loops
- **Status**: TODO

### Tier 3: Functions & Recursion
- **Level 5**: Function calls with parameters
- **Level 6**: Recursive functions (factorial, fibonacci)
- **Status**: TODO

### Tier 4: Advanced Types
- **Level 7**: Pointers and arrays
- **Level 8**: Structs and nested structs
- **Level 9**: String manipulation
- **Status**: TODO

### Tier 5: Meta-Programming
- **Level 10**: Compiler within a compiler
  - Mini lexer/tokenizer
  - Expression evaluator
  - Self-hosting capability test
- **Status**: TODO

## Real-World Programs

Once nullC can compile all 10 levels, we test against real programs:

### Milestone A: Simple CLI Tools
- `wc` - word count
- `cat` - file concatenation
- `echo` - print text

### Milestone B: Data Structures
- Linked list implementation
- Binary tree
- Hash table

### Milestone C: Network Programs
- **TCP Echo Server** (accept connections, echo back)
- **HTTP Parser** (parse simple GET requests)
- **Mini Web Server** (serve static files)

### Milestone D: Self-Hosting
- **nullC compiles itself**
- Bootstrap: gcc compiles nullC v1 → nullC v1 compiles nullC v2
- If v1 == v2, compiler is self-hosting

## Performance Targets

nullC is educational, not optimized. But we track:

- **Compile time**: < 1s for <500 LOC
- **Binary size**: Similar to gcc -O0
- **Correctness**: 100% pass rate on all levels

## Stretch Goals

Beyond the 10 levels:

- Preprocessor (#include, #define)
- Standard library subset (stdio.h basics)
- Inline assembly
- Optimization passes
- LLVM IR output (instead of x86-64 asm)

## Comparison to Other Compilers

| Compiler | Lines of Code | Self-Hosting | Target |
|----------|---------------|--------------|--------|
| TCC      | ~30k          | Yes          | x86    |
| chibicc  | ~10k          | Yes          | x86-64 |
| 8cc      | ~7k           | Yes          | x86    |
| **nullC**| ~2k (goal)    | **Goal**     | x86-64 |

nullC aims to be the smallest self-hosting C compiler for educational purposes.

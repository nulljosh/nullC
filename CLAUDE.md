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

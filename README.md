# nullC

A minimal C compiler written in C. Educational project.

![Project Map](map.svg)

## Status
In development - lexer complete, parser in progress (levels 0-2 working)

## Goals
- Tokenize C source code (lexer)
- Parse into AST (parser)
- Generate x86-64 assembly (codegen)
- Compile simple C programs

## Build
```bash
make
./nullc examples/hello.c
```

## Documentation
- [ROADMAP.md](ROADMAP.md) - Development phases
- [BENCHMARKS.md](BENCHMARKS.md) - Complexity tiers & goals
- [AGENTS.md](AGENTS.md) - AI development guide
- [CLAUDE.md](CLAUDE.md) - Milestones & conventions

## Author
Joshua Trommel (nulljosh)

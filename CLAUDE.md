# nullC Development Notes

## Current Status (2026-02-13)
- Lexer: ✓ Complete
- Parser: ✓ Complete
- Codegen: ✓ Mostly working (9/10 levels)
- Target: ARM64 (Darwin/macOS)

## Test Results
- Level 0-7: ✓ All passing
- Level 8: ✗ Structs (assembly errors)
- Level 9-10: ✓ Passing

## Development Commands

Build and test:
```bash
make
./nullc examples/level1_arithmetic.c
./level1_arithmetic && echo "Exit: $?"
```

Test all levels:
```bash
for f in examples/level*.c; do
  ./nullc "$f" && ./${f%.c} && echo "$f: $?"
done
```

## Commit Format
- feat: New feature
- fix: Bug fix
- refactor: Code restructure
- docs: Documentation

## Next Steps
1. Fix level 8 (structs) assembly errors
2. Optimize codegen (register allocation)
3. Self-hosting test (compile nullC with nullC)

## Code Style
- C99 standard
- Clear over clever
- Comment non-obvious logic
- Test each level incrementally

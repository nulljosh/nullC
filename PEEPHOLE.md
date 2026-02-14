# Peephole Optimization

## What It Does

Removes redundant instruction pairs from generated ARM64 assembly.

**Pattern detected:**
```asm
str xN, [sp, #-16]!   # Store register to stack
ldr xN, [sp], #16     # Immediately load same register from stack
```

This is a no-op (store then load with no useful work between).

## Results

Tested on all 11 complexity levels:

| Level | Description | Pairs Removed |
|-------|-------------|---------------|
| 0 | Hello World | 0 |
| 1 | Arithmetic | 0 |
| 2 | Variables | 0 |
| 3 | Conditionals | 0 |
| 4 | Loops | 0 |
| 5 | Functions | 0 |
| 6 | Recursion | **5** ✓ |
| 7 | Pointers | 0 |
| 8 | Structs | **1** ✓ |
| 9 | Strings | **1** ✓ |
| 10 | Meta-Compiler | **3** ✓ |

**Total:** 10 redundant instruction pairs removed

## Impact

- **Fewer instructions:** 10 fewer instructions across test suite
- **Correctness:** All tests still pass with expected exit codes
- **Code quality:** Cleaner assembly output

## How It Works

1. `nullc` generates assembly → `.s` file
2. `peephole` optimizer post-processes the `.s` file
3. Optimized assembly is assembled and linked

**Usage:**
```bash
./nullc examples/level6_recursion.c
# Output: Peephole: removed 5 redundant instruction pair(s)
```

## Conservative Approach

Only removes **true no-ops** where:
- Same register is stored then loaded
- No useful instructions between store/load
- Immediate stack push/pop pattern

Does NOT optimize:
- Different registers (even if semantically equivalent)
- Stores used for temporary values
- Complex instruction sequences

## Why Not More Aggressive?

More patterns could be optimized (e.g., stack juggling with different registers), but:
- Higher risk of breaking correctness
- More complex pattern matching needed
- Educational value is already demonstrated

This is a **teaching tool**, not a production optimizer.

## Future Optimizations

Potential next steps (not implemented):
- Constant folding (`5 + 3` → `8`)
- Register allocation (use x0-x7 instead of stack)
- Strength reduction (multiply by 2 → left shift)
- Dead code elimination

See `OPTIMIZATIONS.md` for details.

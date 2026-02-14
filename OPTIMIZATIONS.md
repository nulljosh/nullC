# nullC Optimization Opportunities

## Current State
- Working compiler, all 10 levels passing
- ARM64 output is correct but not optimized
- Heavy use of stack for temporaries (should use registers)

## Low-Hanging Fruit

### 1. Peephole Optimization (Easy, 1-2 hours)
Remove redundant patterns:
```asm
; Before:
str x0, [sp, #-16]!
ldr x0, [sp], #16

; After: (just remove both)
```

### 2. Register Allocation (Medium, 4-8 hours)
Currently uses only x0 for expressions. Could use x0-x7 for temporaries.

Benefits:
- Fewer memory operations
- ~2-3x faster code
- More like real compilers

### 3. Constant Folding (Easy, 1 hour)
Evaluate at compile time:
```c
int x = 5 + 3;  // Could emit: mov x0, #8
```

### 4. Dead Code Elimination (Medium, 2-4 hours)
Remove unused variables and unreachable code.

### 5. Strength Reduction (Easy, 1 hour)
Replace expensive ops:
```c
x * 2   →  x << 1   (shift is faster than multiply)
x / 4   →  x >> 2
```

## Performance Baseline

Test with level1_arithmetic.c:
```bash
time ./level1_arithmetic
```

Current: ~0.001s (dominated by process startup)
Optimized: Same user time, but fewer instructions

Measure with:
```bash
./nullc examples/level1_arithmetic.c
wc -l examples/level1_arithmetic.s  # Count assembly lines
```

## Implementation Plan

**Night 1 (1-2 hours):**
- Peephole optimization pass
- Constant folding

**Night 2 (4-6 hours):**
- Basic register allocation (expression trees)
- Use x0-x7 for temporaries

**Night 3:**
- Dead code elimination
- Strength reduction

**Result:** 30-40% fewer instructions, cleaner assembly

## Why Not Essential

nullC is a learning project. The code is:
- ✓ Correct (all tests pass)
- ✓ Readable (easy to understand)
- ✓ Complete (handles all features)

Optimization is educational but not required for the project goals.

Real-world C compilers (gcc, clang) have thousands of optimization passes built over decades. We'd never match them, nor should we try.

## If We Optimize

Focus on **one clear optimization** that teaches something, rather than trying to be "production ready."

Peephole optimization is perfect:
- Easy to implement
- Teaches pattern matching
- Visible results
- Doesn't break existing code

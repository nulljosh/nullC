.section __TEXT,__text

.globl _is_digit
_is_digit:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    str x0, [x29, #-8]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #48
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, ge
    cmp x0, #0
    b.eq .L0
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #57
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, le
    cmp x0, #0
    b.eq .L0
    mov x0, #1
    b .L1
.L0:
    mov x0, #0
.L1:
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _next_token
_next_token:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #48
    str x0, [x29, #-8]
    str x1, [x29, #-16]
.L2:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x0, [x0]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #32
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.ne .L4
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x0, [x0]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #9
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.ne .L4
    mov x0, #0
    b .L5
.L4:
    mov x0, #1
.L5:
    cmp x0, #0
    b.eq .L3
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    b .L2
.L3:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x0, [x0]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [x29, #-40]
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L7
    add x0, x29, #-32
    str x0, [sp, #-16]!
    mov x0, #5
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-32
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
.L7:
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _is_digit
    cmp x0, #0
    b.eq .L9
    add x0, x29, #-32
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-32
    add x0, x0, #8
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    str x0, [x9]
.L10:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x0, [x0]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _is_digit
    cmp x0, #0
    b.eq .L11
    add x0, x29, #-32
    add x0, x0, #8
    str x0, [sp, #-16]!
    add x0, x29, #-32
    add x0, x0, #8
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #10
    ldr x9, [sp], #16
    mul x0, x9, x0
    str x0, [sp, #-16]!
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x0, [x0]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #48
    ldr x9, [sp], #16
    sub x0, x9, x0
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    b .L10
.L11:
    add x0, x29, #-32
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
.L9:
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    mov x0, #43
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L12
    add x0, x29, #-32
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    str x0, [x9]
    b .L13
.L12:
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    mov x0, #45
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L14
    add x0, x29, #-32
    str x0, [sp, #-16]!
    mov x0, #2
    ldr x9, [sp], #16
    str x0, [x9]
    b .L15
.L14:
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    mov x0, #42
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L16
    add x0, x29, #-32
    str x0, [sp, #-16]!
    mov x0, #3
    ldr x9, [sp], #16
    str x0, [x9]
    b .L17
.L16:
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    mov x0, #47
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L19
    add x0, x29, #-32
    str x0, [sp, #-16]!
    mov x0, #4
    ldr x9, [sp], #16
    str x0, [x9]
.L19:
.L17:
.L15:
.L13:
    add x0, x29, #-32
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _evaluate
_evaluate:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #64
    str x0, [x29, #-8]
    mov x0, #0
    str x0, [x29, #-16]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    add x0, x29, #-16
    str x0, [sp, #-16]!
    ldr x1, [sp], #16
    ldr x0, [sp], #16
    bl _next_token
    str x0, [x29, #-32]
    add x0, x29, #-32
    add x0, x0, #8
    ldr x0, [x0]
    str x0, [x29, #-40]
.L20:
    mov x0, #1
    cmp x0, #0
    b.eq .L21
    add x0, x29, #-32
    str x0, [sp, #-16]!
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    add x0, x29, #-16
    str x0, [sp, #-16]!
    ldr x1, [sp], #16
    ldr x0, [sp], #16
    bl _next_token
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-32
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #5
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L23
    b .L21
.L23:
    add x0, x29, #-32
    ldr x0, [x0]
    str x0, [x29, #-48]
    add x0, x29, #-32
    str x0, [sp, #-16]!
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    add x0, x29, #-16
    str x0, [sp, #-16]!
    ldr x1, [sp], #16
    ldr x0, [sp], #16
    bl _next_token
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-32
    add x0, x0, #8
    ldr x0, [x0]
    str x0, [x29, #-56]
    ldr x0, [x29, #-48]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L24
    add x0, x29, #-40
    str x0, [sp, #-16]!
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-56]
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    b .L25
.L24:
    ldr x0, [x29, #-48]
    str x0, [sp, #-16]!
    mov x0, #2
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L26
    add x0, x29, #-40
    str x0, [sp, #-16]!
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-56]
    ldr x9, [sp], #16
    sub x0, x9, x0
    ldr x9, [sp], #16
    str x0, [x9]
    b .L27
.L26:
    ldr x0, [x29, #-48]
    str x0, [sp, #-16]!
    mov x0, #3
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L28
    add x0, x29, #-40
    str x0, [sp, #-16]!
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-56]
    ldr x9, [sp], #16
    mul x0, x9, x0
    ldr x9, [sp], #16
    str x0, [x9]
    b .L29
.L28:
    ldr x0, [x29, #-48]
    str x0, [sp, #-16]!
    mov x0, #4
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
    cmp x0, #0
    b.eq .L31
    add x0, x29, #-40
    str x0, [sp, #-16]!
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-56]
    ldr x9, [sp], #16
    sdiv x0, x9, x0
    ldr x9, [sp], #16
    str x0, [x9]
.L31:
.L29:
.L27:
.L25:
    b .L20
.L21:
    ldr x0, [x29, #-40]
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #160
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #49
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #1
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #48
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #2
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #32
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #3
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #43
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #4
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #32
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #5
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #53
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #6
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #32
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #7
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #42
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #8
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #32
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #9
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #50
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    mov x0, #10
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _evaluate
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


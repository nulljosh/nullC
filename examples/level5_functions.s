.section __TEXT,__text

.globl _add
_add:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x9, [sp], #16
    add x0, x0, x9
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _multiply
_multiply:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #32
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #0
    str x0, [x29, #-24]
    mov x0, #0
    str x0, [x29, #-32]
.L0:
    ldr x0, [x29, #-32]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x9, [sp], #16
    cmp x0, x9
    setl %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L1
    add x0, x29, -24(x29)
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x1
    ldr x0
    bl _add
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, -32(x29)
    str x0, [sp, #-16]!
    ldr x0, [x29, #-32]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    b .L0
.L1:
    ldr x0, [x29, #-24]
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
    sub sp, sp, #16
    mov x0, #5
    str x0, [sp, #-16]!
    mov x0, #10
    str x0, [sp, #-16]!
    ldr x1
    ldr x0
    bl _add
    str x0, [x29, #-8]
    mov x0, #3
    str x0, [sp, #-16]!
    mov x0, #4
    str x0, [sp, #-16]!
    ldr x1
    ldr x0
    bl _multiply
    str x0, [x29, #-16]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x1
    ldr x0
    bl _add
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


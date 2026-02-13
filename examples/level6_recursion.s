.section __TEXT,__text

.globl _factorial
_factorial:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    str x0, [x29, #-8]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, le
    cmp x0, #0
    b.eq .L1
    mov x0, #1
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
.L1:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    sub x0, x9, x0
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _factorial
    ldr x9, [sp], #16
    mul x0, x9, x0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _fibonacci
_fibonacci:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    str x0, [x29, #-8]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, le
    cmp x0, #0
    b.eq .L3
    ldr x0, [x29, #-8]
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
.L3:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    sub x0, x9, x0
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _fibonacci
    str x0, [sp, #-16]!
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #2
    ldr x9, [sp], #16
    sub x0, x9, x0
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _fibonacci
    ldr x9, [sp], #16
    add x0, x0, x9
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
    ldr x0, [sp], #16
    bl _factorial
    str x0, [x29, #-8]
    mov x0, #7
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _fibonacci
    str x0, [x29, #-16]
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


.section __TEXT,__text

.globl _add
_add:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    mov x0, -8(x29)
    mov x1, -16(x29)
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -16(x29), x0
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
    mov x0, -8(x29)
    mov x1, -16(x29)
    mov x0, #0
    mov x0, -24(x29)
    mov x0, #0
    mov x0, -32(x29)
.L0:
    mov -32(x29), x0
    str x0, [sp, #-16]!
    mov -16(x29), x0
    ldr x9, [sp], #16
    cmp x0, x9
    setl %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L1
    add x0, x29, -24(x29)
    str x0, [sp, #-16]!
    mov -24(x29), x0
    str x0, [sp, #-16]!
    mov -8(x29), x0
    str x0, [sp, #-16]!
    ldr x1
    ldr x0
    bl _add
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -32(x29)
    str x0, [sp, #-16]!
    mov -32(x29), x0
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    mov x0, (x9)
    b .L0
.L1:
    mov -24(x29), x0
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
    mov x0, -8(x29)
    mov x0, #3
    str x0, [sp, #-16]!
    mov x0, #4
    str x0, [sp, #-16]!
    ldr x1
    ldr x0
    bl _multiply
    mov x0, -16(x29)
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -16(x29), x0
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


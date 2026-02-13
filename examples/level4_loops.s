.section __TEXT,__text

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #32
    mov x0, #0
    str x0, [x29, #-8]
    mov x0, #0
    str x0, [x29, #-16]
.L0:
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    mov x0, #10
    ldr x9, [sp], #16
    cmp x0, x9
    setl %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L1
    add x0, x29, -8(x29)
    str x0, [sp, #-16]!
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, -16(x29)
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    b .L0
.L1:
    mov x0, #0
    str x0, [x29, #-24]
.L2:
    ldr x0, [x29, #-24]
    str x0, [sp, #-16]!
    mov x0, #5
    ldr x9, [sp], #16
    cmp x0, x9
    setl %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L3
    add x0, x29, -8(x29)
    str x0, [sp, #-16]!
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, -24(x29)
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    b .L2
.L3:
    ldr x0, [x29, #-8]
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


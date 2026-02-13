.section __TEXT,__text

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    mov x0, #42
    str x0, [x29, #-8]
    mov x0, #0
    str x0, [x29, #-16]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #50
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, gt
    cmp x0, #0
    b.eq .L0
    add x0, x29, #-16
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    str x0, [x9]
    b .L1
.L0:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    mov x0, #30
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, gt
    cmp x0, #0
    b.eq .L2
    add x0, x29, #-16
    str x0, [sp, #-16]!
    mov x0, #2
    ldr x9, [sp], #16
    str x0, [x9]
    b .L3
.L2:
    add x0, x29, #-16
    str x0, [sp, #-16]!
    mov x0, #3
    ldr x9, [sp], #16
    str x0, [x9]
.L3:
.L1:
    ldr x0, [x29, #-16]
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


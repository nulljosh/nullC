.section __TEXT,__text

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #64
    add x0, x29, #-40
    str x0, [sp, #-16]!
    mov x0, #0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #10
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-40
    str x0, [sp, #-16]!
    mov x0, #1
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #20
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-40
    str x0, [sp, #-16]!
    mov x0, #2
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #30
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-40
    str x0, [sp, #-16]!
    mov x0, #3
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #40
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-40
    str x0, [sp, #-16]!
    mov x0, #4
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #50
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-40
    str x0, [x29, #-48]
    mov x0, #0
    str x0, [x29, #-56]
    mov x0, #0
    str x0, [x29, #-64]
.L0:
    ldr x0, [x29, #-64]
    str x0, [sp, #-16]!
    mov x0, #5
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, lt
    cmp x0, #0
    b.eq .L1
    add x0, x29, #-56
    str x0, [sp, #-16]!
    ldr x0, [x29, #-56]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-48]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-64]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-64
    str x0, [sp, #-16]!
    ldr x0, [x29, #-64]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    b .L0
.L1:
    ldr x0, [x29, #-56]
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


.section __TEXT,__text

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #64
    add x0, x29, -40(x29)
    str x0, [sp, #-16]!
    mov x0, #0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #10
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -40(x29)
    str x0, [sp, #-16]!
    mov x0, #1
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #20
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -40(x29)
    str x0, [sp, #-16]!
    mov x0, #2
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #30
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -40(x29)
    str x0, [sp, #-16]!
    mov x0, #3
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #40
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -40(x29)
    str x0, [sp, #-16]!
    mov x0, #4
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #50
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -40(x29)
    mov x0, -48(x29)
    mov x0, #0
    mov x0, -56(x29)
    mov x0, #0
    mov x0, -64(x29)
.L0:
    mov -64(x29), x0
    str x0, [sp, #-16]!
    mov x0, #5
    ldr x9, [sp], #16
    cmp x0, x9
    setl %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L1
    add x0, x29, -56(x29)
    str x0, [sp, #-16]!
    mov -56(x29), x0
    str x0, [sp, #-16]!
    mov -48(x29), x0
    str x0, [sp, #-16]!
    mov -64(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -64(x29)
    str x0, [sp, #-16]!
    mov -64(x29), x0
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    mov x0, (x9)
    b .L0
.L1:
    mov -56(x29), x0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


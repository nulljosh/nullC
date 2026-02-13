.section __TEXT,__text

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    mov x0, #42
    mov x0, -8(x29)
    mov x0, #0
    mov x0, -16(x29)
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov x0, #50
    ldr x9, [sp], #16
    cmp x0, x9
    setg %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L0
    add x0, x29, -16(x29)
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    mov x0, (x9)
    b .L1
.L0:
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov x0, #30
    ldr x9, [sp], #16
    cmp x0, x9
    setg %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L2
    add x0, x29, -16(x29)
    str x0, [sp, #-16]!
    mov x0, #2
    ldr x9, [sp], #16
    mov x0, (x9)
    b .L3
.L2:
    add x0, x29, -16(x29)
    str x0, [sp, #-16]!
    mov x0, #3
    ldr x9, [sp], #16
    mov x0, (x9)
.L3:
.L1:
    mov -16(x29), x0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


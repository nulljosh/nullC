.section __TEXT,__text

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #32
    mov x0, #5
    str x0, [sp, #-16]!
    mov x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov x0, -8(x29)
    mov x0, #10
    str x0, [sp, #-16]!
    mov x0, #2
    ldr x9, [sp], #16
    sub x0, x9
    mov x9, x0
    mov x0, -16(x29)
    mov x0, #4
    str x0, [sp, #-16]!
    mov x0, #7
    ldr x9, [sp], #16
    mul x9, x0
    mov x0, -24(x29)
    mov x0, #20
    str x0, [sp, #-16]!
    mov x0, #5
    ldr x9, [sp], #16
    mov x0, x12
    mov x9, x0
    // cqto (ARM: use sdiv directly)
    sdiv x0, x0, x12
    mov x0, -32(x29)
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -16(x29), x0
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov -24(x29), x0
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov -32(x29), x0
    ldr x9, [sp], #16
    add x0, x0, x9
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


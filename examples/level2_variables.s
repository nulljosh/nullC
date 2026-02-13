.section __TEXT,__text

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #48
    mov x0, #10
    str x0, [x29, #-8]
    mov x0, #20
    str x0, [x29, #-16]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [x29, #-24]
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    ldr x9, [sp], #16
    mul x9, x9, x0
    str x0, [x29, #-32]
    ldr x0, [x29, #-24]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-32]
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #2
    ldr x9, [sp], #16
    mov x0, x12
    mov x9, x0
    // cqto (ARM: use sdiv directly)
    sdiv x0, x0, x12
    str x0, [x29, #-40]
    ldr x0, [x29, #-40]
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


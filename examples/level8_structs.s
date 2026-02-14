.section __TEXT,__text

.globl _calculate_area
_calculate_area:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #48
    mov x9, x0
    ldr x0, [x9, #0]
    str x0, [x29, #-32]
    ldr x0, [x9, #8]
    str x0, [x29, #-24]
    ldr x0, [x9, #16]
    str x0, [x29, #-16]
    ldr x0, [x9, #24]
    str x0, [x29, #-8]
    add x0, x29, #-32
    add x0, x0, #16
    ldr x0, [x0]
    str x0, [sp, #-16]!
    add x0, x29, #-32
    ldr x0, [x0]
    ldr x9, [sp], #16
    sub x0, x9, x0
    str x0, [x29, #-40]
    add x0, x29, #-32
    add x0, x0, #16
    add x0, x0, #8
    ldr x0, [x0]
    str x0, [sp, #-16]!
    add x0, x29, #-32
    add x0, x0, #8
    ldr x0, [x0]
    ldr x9, [sp], #16
    sub x0, x9, x0
    str x0, [x29, #-48]
    ldr x0, [x29, #-40]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-48]
    ldr x9, [sp], #16
    mul x0, x9, x0
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
    sub sp, sp, #32
    add x0, x29, #-32
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-32
    add x0, x0, #8
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-32
    add x0, x0, #16
    str x0, [sp, #-16]!
    mov x0, #10
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-32
    add x0, x0, #16
    add x0, x0, #8
    str x0, [sp, #-16]!
    mov x0, #5
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-32
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _calculate_area
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


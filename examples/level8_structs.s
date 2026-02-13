.section __TEXT,__text

.globl _calculate_area
_calculate_area:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #32
    mov 0(x0), x0
    mov x0, -16(x29)
    mov 8(x0), x0
    mov x0, -8(x29)
    add x0, x29, -16(x29)
    add x0, x0, #8
    mov (x0), x0
    str x0, [sp, #-16]!
    add x0, x29, -16(x29)
    mov (x0), x0
    ldr x9, [sp], #16
    sub x0, x9
    mov x9, x0
    mov x0, -24(x29)
    add x0, x29, -16(x29)
    add x0, x0, #8
    add x0, x0, #8
    mov (x0), x0
    str x0, [sp, #-16]!
    add x0, x29, -16(x29)
    add x0, x0, #8
    mov (x0), x0
    ldr x9, [sp], #16
    sub x0, x9
    mov x9, x0
    mov x0, -32(x29)
    mov -24(x29), x0
    str x0, [sp, #-16]!
    mov -32(x29), x0
    ldr x9, [sp], #16
    mul x9, x0
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
    add x0, x29, -16(x29)
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -16(x29)
    add x0, x0, #8
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -16(x29)
    add x0, x0, #8
    str x0, [sp, #-16]!
    mov x0, #10
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -16(x29)
    add x0, x0, #8
    add x0, x0, #8
    str x0, [sp, #-16]!
    mov x0, #5
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -16(x29)
    str x0, [sp, #-16]!
    ldr x0
    bl _calculate_area
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


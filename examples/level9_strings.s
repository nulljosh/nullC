.section __DATA,__data
.str0:
    .asciz "Hello"

.section __TEXT,__text

.globl _string_length
_string_length:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    mov x0, -8(x29)
    mov x0, #0
    mov x0, -16(x29)
.L0:
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -16(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x0, x9
    setne %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L1
    add x0, x29, -16(x29)
    str x0, [sp, #-16]!
    mov -16(x29), x0
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    mov x0, (x9)
    b .L0
.L1:
    mov -16(x29), x0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _string_compare
_string_compare:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #32
    mov x0, -8(x29)
    mov x1, -16(x29)
    mov x0, #0
    mov x0, -24(x29)
.L2:
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x0, x9
    setne %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L4
    mov -16(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x0, x9
    setne %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L4
    mov x0, #1
    b .L5
.L4:
    mov x0, #0
.L5:
    cmp x0, #0
    b.eq .L3
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    str x0, [sp, #-16]!
    mov -16(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    ldr x9, [sp], #16
    cmp x0, x9
    setne %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L7
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
.L7:
    add x0, x29, -24(x29)
    str x0, [sp, #-16]!
    mov -24(x29), x0
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    mov x0, (x9)
    b .L2
.L3:
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    str x0, [sp, #-16]!
    mov -16(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    ldr x9, [sp], #16
    cmp x0, x9
    sete %al
    movzbq %al, x0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _string_copy
_string_copy:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #32
    mov x0, -8(x29)
    mov x1, -16(x29)
    mov x0, #0
    mov x0, -24(x29)
.L8:
    mov -16(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x0, x9
    setne %al
    movzbq %al, x0
    cmp x0, #0
    b.eq .L9
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov -16(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    mov (x0), x0
    ldr x9, [sp], #16
    mov x0, (x9)
    add x0, x29, -24(x29)
    str x0, [sp, #-16]!
    mov -24(x29), x0
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    mov x0, (x9)
    b .L8
.L9:
    mov -8(x29), x0
    str x0, [sp, #-16]!
    mov -24(x29), x0
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    mov x0, (x9)
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #192
    add x0, x29, .str0()
    mov x0, -168(x29)
    add x0, x29, -160(x29)
    str x0, [sp, #-16]!
    mov -168(x29), x0
    str x0, [sp, #-16]!
    ldr x1
    ldr x0
    bl _string_copy
    add x0, x29, -160(x29)
    str x0, [sp, #-16]!
    ldr x0
    bl _string_length
    mov x0, -176(x29)
    add x0, x29, -160(x29)
    str x0, [sp, #-16]!
    add x0, x29, .str0()
    str x0, [sp, #-16]!
    ldr x1
    ldr x0
    bl _string_compare
    mov x0, -184(x29)
    mov -176(x29), x0
    str x0, [sp, #-16]!
    mov -184(x29), x0
    ldr x9, [sp], #16
    add x0, x0, x9
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


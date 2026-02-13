.section __DATA,__data
.str0:
    .asciz "Hello"

.section __TEXT,__text

.globl _string_length
_string_length:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #16
    str x0, [x29, #-8]
    mov x0, #0
    str x0, [x29, #-16]
.L0:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, ne
    cmp x0, #0
    b.eq .L1
    add x0, x29, #-16
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
    ldr x0, [x29, #-16]
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
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #0
    str x0, [x29, #-24]
.L2:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, ne
    cmp x0, #0
    b.eq .L4
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, ne
    cmp x0, #0
    b.eq .L4
    mov x0, #1
    b .L5
.L4:
    mov x0, #0
.L5:
    cmp x0, #0
    b.eq .L3
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, ne
    cmp x0, #0
    b.eq .L7
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
.L7:
    add x0, x29, #-24
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
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, eq
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
    str x0, [x29, #-8]
    str x1, [x29, #-16]
    mov x0, #0
    str x0, [x29, #-24]
.L8:
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    cmp x9, x0
    cset x0, ne
    cmp x0, #0
    b.eq .L9
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    ldr x0, [x29, #-16]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x0, [x0]
    ldr x9, [sp], #16
    str x0, [x9]
    add x0, x29, #-24
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    str x0, [sp, #-16]!
    mov x0, #1
    ldr x9, [sp], #16
    add x0, x0, x9
    ldr x9, [sp], #16
    str x0, [x9]
    b .L8
.L9:
    ldr x0, [x29, #-8]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-24]
    lsl x0, x0, #3
    ldr x9, [sp], #16
    add x0, x0, x9
    str x0, [sp, #-16]!
    mov x0, #0
    ldr x9, [sp], #16
    str x0, [x9]
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret

.globl _main
_main:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    sub sp, sp, #192
    adrp x0, .str0@PAGE
    add x0, x0, .str0@PAGEOFF
    str x0, [x29, #-168]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    ldr x0, [x29, #-168]
    str x0, [sp, #-16]!
    ldr x1, [sp], #16
    ldr x0, [sp], #16
    bl _string_copy
    add x0, x29, #-160
    str x0, [sp, #-16]!
    ldr x0, [sp], #16
    bl _string_length
    str x0, [x29, #-176]
    add x0, x29, #-160
    str x0, [sp, #-16]!
    adrp x0, .str0@PAGE
    add x0, x0, .str0@PAGEOFF
    str x0, [sp, #-16]!
    ldr x1, [sp], #16
    ldr x0, [sp], #16
    bl _string_compare
    str x0, [x29, #-184]
    ldr x0, [x29, #-176]
    str x0, [sp, #-16]!
    ldr x0, [x29, #-184]
    ldr x9, [sp], #16
    add x0, x0, x9
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret
    mov x0, #0
    mov sp, x29
    ldp x29, x30, [sp], #16
    ret


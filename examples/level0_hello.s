.section __TEXT,__text

.globl _main
_main:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp
    movq $0, %rax
    movq %rbp, %rsp
    popq %rbp
    retq
    movq $0, %rax
    movq %rbp, %rsp
    popq %rbp
    retq


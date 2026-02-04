.global _start
.extern init

.section .text
_start:
    /* 1. Sovereign Stack Setup (AT&T Syntax) */
    /* Load RIP-relative address of __stack_top into %rsp */
    leaq __stack_top(%rip), %rsp

    /* 2. Jump to Rust */
    call init

    /* 3. Trap if init returns */
    ud2

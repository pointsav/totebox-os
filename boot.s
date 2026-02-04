/* 1. Multiboot 1 Header (For Legacy/PC Compatibility) */
.section .multiboot
.align 4
    .long 0x1BADB002             /* Magic */
    .long 0x00000003             /* Flags: Align + Mem Info */
    .long -(0x1BADB002 + 0x00000003) /* Checksum */

/* 2. PVH ELF Note (The "Magic Bullet" for QEMU q35) */
.section .note.pvh
.align 4
    .long 4                      /* Name size */
    .long 4                      /* Desc size */
    .long 18                     /* Type: ELF_NOTE_PVH */
    .ascii "XYZ1"                /* Name */
    .long 0                      /* Desc */

/* 3. Entry Point */
.section .text
.global _start
_start:
    cli                          /* Clear Interrupts */
    jmp init                     /* Jump to Rust Entry */

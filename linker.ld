ENTRY(_start)

PHDRS
{
    /* One Ring to rule them all: A single RWE segment */
    all PT_LOAD FLAGS(7); /* 7 = Read + Write + Execute */
}

SECTIONS
{
    . = 0x200000;

    .text : ALIGN(4096) { 
        *(.text .text.*) 
    } :all

    .rodata : ALIGN(4096) { 
        *(.rodata .rodata.*) 
    } :all

    .data : ALIGN(4096) { 
        *(.data .data.*) 
    } :all

    .bss : ALIGN(4096) {
        *(.bss .bss.*)
        
        /* Sovereign Stack */
        . = ALIGN(4096);
        __stack_bottom = .;
        . += 0x10000; /* 64KB */
        __stack_top = .;
    } :all

    /DISCARD/ : { *(.comment) *(.eh_frame) }
}

__sel4_ipc_buffer_obj = 0x300000;

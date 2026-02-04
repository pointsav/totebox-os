# FOUNDRY LOG: Totebox OS x86_64 Bring-up
**Status:** SUCCESSFUL USERLAND ENTRY (Zen Loop Stable)

## Master Boot Command
qemu-system-x86_64 \
    -machine pc -cpu max -m 2G -nographic -serial mon:stdio \
    -kernel ./sdk/board/x86_64_generic/debug/elf/sel4_32.elf \
    -initrd ./build/totebox_os.img

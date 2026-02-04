#!/bin/bash
# Totebox OS Sovereign Boot Utility

KERNEL="./sdk/board/x86_64_generic/debug/elf/sel4_32.elf"
IMAGE="./build/totebox_os.img"

if [ ! -f "$KERNEL" ]; then
    echo "Error: Kernel not found at $KERNEL"
    exit 1
fi

qemu-system-x86_64 \
    -machine pc \
    -cpu max \
    -m 2G \
    -nographic \
    -serial mon:stdio \
    -kernel "$KERNEL" \
    -initrd "$IMAGE"

# Totebox OS v1.0

**Totebox OS** is a high-assurance orchestration system designed for the **PointSav Digital Systems AG** ecosystem. Built on the **seL4 Microkernel** and the **Microkit** framework, it provides strict isolation and deterministic execution for critical business logic components.

## Architecture
Totebox OS implements a "Triple-Bind" security model to ensure operational integrity:

* **Hardware Abstraction:** Strict x86_64 isolation using the formally verified seL4 kernel.
* **Deterministic Boot:** A custom 32-bit-to-64-bit handoff mechanism (`sel4_32.elf`) ensuring a secure transition from BIOS to the Long Mode kernel.
* **Memory Safety:** Protection Domains utilize a statically allocated stack within the `.bss` segment, guaranteeing physical memory backing at load time and eliminating runtime page faults.

## System Components
The current version (v1.0) orchestrates three isolated Protection Domains (PDs):

1. **Email Server:** An isolated gateway for external communication.
2. **People DB:** Encapsulated identity and stakeholder management logic.
3. **Proofreader:** A verification engine for document integrity.

## Getting Started

### Prerequisites
* **Rust:** Nightly toolchain with `x86_64-unknown-none` target.
* **seL4 Microkit:** SDK for system image generation.
* **QEMU:** `qemu-system-x86_64` (v6.0+ recommended).

### Build & Deploy
The project includes a unified boot utility for the x86_64 architecture.

```bash
# 1. Build Protection Domains
cargo build --release

# 2. Generate System Image
./sdk/bin/microkit system/system.xml \
    --search-path build \
    --board x86_64_generic \
    --config debug \
    -o build/totebox_os.img

# 3. Boot System
./boot.sh

#![no_std]
#![no_main]

use core::panic::PanicInfo;

// --- HANDSHAKE SYMBOLS ---
#[no_mangle] #[used] pub static mut microkit_name: [u8; 16] = [0; 16];
#[no_mangle] #[used] pub static mut microkit_passive: bool = false;
#[no_mangle] #[used] pub static mut microkit_irqs: [u8; 64] = [0; 64];
#[no_mangle] #[used] pub static mut microkit_notifications: [u64; 64] = [0; 64];
#[no_mangle] #[used] pub static mut microkit_pps: [u8; 64] = [0; 64];
#[no_mangle] #[used] pub static mut microkit_ioports: [u8; 64] = [0; 64];

#[no_mangle]
pub extern "C" fn init() {
    // 1. Establish the Stack (The assembly shim did this, but we are safe now)
    
    // 2. The Sovereign Spin
    // If we reach here and stay here without crashing, the OS is stable.
    loop {}
}

#[no_mangle]
pub extern "C" fn notified(_ch: u64) {}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! { loop {} }

// File: Load64BitConstant.s
// Description: LEGv8 assembly to load the 64-bit constant 0x1122334455667788 into register X0

MOVZ X0, #0x7788           // Move the lower 16 bits (0x7788) into X0
MOVK X0, #0x5566, LSL #16   // Insert the next 16 bits (0x5566) into X0, shifting left by 16
MOVK X0, #0x3344, LSL #32   // Insert the next 16 bits (0x3344) into X0, shifting left by 32
MOVK X0, #0x1122, LSL #48   // Insert the highest 16 bits (0x1122) into X0, shifting left by 48

// Now X0 contains the value 0x1122334455667788

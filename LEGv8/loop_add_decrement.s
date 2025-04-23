// File: loop_add_decrement.s
// Description: LEGv8 implementation of: 
// acc = 0; 
// i = 10; 
// while (i > 0) { 
//     acc += 2; 
//     i--; 
// }

// Variable to register mapping:
// acc → X0
// i   → X1

LOOP:   SUBIS X1, X1, #0     // Compare i with 0 (sets flags based on X1 - 0)
        B.LE  DONE           // If i <= 0, exit loop
        SUBI  X1, X1, #1     // i--
        ADDI  X0, X0, #2     // acc += 2
        B     LOOP           // Repeat loop
DONE:

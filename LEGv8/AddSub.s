// File: AddSub.s
// Description: LEGv8 implementation of the C statement f = g + (h - 5);
// Assume that the C variables f, g, and h have already been placed in registers X0, X1, and X2, respectively. 
// Use a minimal number of LEGv8 assembly instructions.

SUBI X2, X2, #5         // X2 = h - 5
ADD  X0, X1, X2         // X0 = g + (h - 5)

// File: AddSub.s
// Description: LEGv8 implementation of the C statement f = g + (h - 5);

SUBI X2, X2, #5         // X2 = h - 5
ADD  X0, X1, X2         // X0 = g + (h - 5)

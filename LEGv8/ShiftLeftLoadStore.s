// File: ShiftLeftLoadStore.s
// Description: LEGv8 implementation to store A[i-j] into B[8].
// Equivalent C statement: B[8] = A[i−j];
// Assume that the variables f, g, h, i, and j are assigned to
// registers X0,X1,X2,X3, and X4, respectively. Assume that the base address of the
// arrays A and B are in registers X6 and X7, respectively.

SUB  X9, X3, X4        // Compute i - j
LSL  X9, X9, #3        // Multiply by 8 to convert word offset to byte offset
ADD  X11, X6, X9       // Compute address of A[i-j]
LDUR X10, [X11, #0]    // Load A[i-j]
STUR X10, [X7, #64]    // Store A[i-j] into B[8]

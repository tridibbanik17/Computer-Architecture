// File: IndexedArraySumStore.s
// Description: LEGv8 implementation of the C statement: B[g] = A[f] + A[f+1]
// Assume that the variables f, g, h, i, and j are assigned
// to registers X0, X1, X2, X3, and X4, respectively. Assume that the base address of
// the arrays A and B are in registers X6 and X7, respectively.

LSL  X9, X0, #3        // X9 = f * 8 (byte offset)
ADD  X9, X6, X9        // X9 = &A[f]
LSL  X10, X1, #3       // X10 = g * 8 (byte offset)
ADD  X10, X7, X10      // X10 = &B[g]

LDUR X0, [X9, #0]      // Load A[f] into X0
ADDI X11, X9, #8       // Compute address of A[f+1]
LDUR X9, [X11, #0]     // Load A[f+1] into X9

ADD  X9, X9, X0        // X9 = A[f] + A[f+1]
STUR X9, [X10, #0]     // Store result in B[g]

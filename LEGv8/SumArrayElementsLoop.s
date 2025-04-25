// File: SumArrayElementsLoop.s
// Equivalent C statement is below:
// int i;
// int result = 0;

// i = 0;

// while (i < 100) {
//     result += MemArray[i];
//     i++;
// }

// return result;

// Assume that the C-level
// integer i is held in register X10,X0 holds the C-level integer called result, and
// X1 holds the base address of the integer MemArray.


ORR X10, XZR, XZR        // i = 0 (XZR is zero register, so ORR with XZR sets X10 to 0)

LOOP:
    LDUR X11, [X1, #0]    // Load MemArray[i] into X11 (X1 holds base address of MemArray, i is in X10)
    ADD X0, X0, X11       // result += MemArray[i] (X0 is result, X11 holds MemArray[i])
    ADDI X1, X1, #8       // Increment MemArray address (each element is 8 bytes, so move to next element)
    ADDI X10, X10, #1     // i++ (increment index i stored in X10)
    CMPI X10, #100        // Compare i with 100 (end loop condition)
    B.LT LOOP             // If i < 100, branch back to LOOP
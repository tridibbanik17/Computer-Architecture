.section .data
format_string: .asciz "Factorial: %d\n"

.section .text
.global _start
.extern printf
.extern atoi

_start:
	// Load argc (number of arguments)
        LDR X0, [SP]            
        CMP X0, #2              // Check if the number of arguments is 2 (program name and n)
        B.NE exit               // If not, exit

        // Load argv[1] (n as string)
        LDR X0, [SP, #16]       // x0 contains the address to the string argv[1]
        BL atoi                 // Convert string to integer and returns in register x0

        BL factorial            // Call factorial function

        // Move the return value to X1 and call printf
        MOV X1, X0              
        LDR X0, =format_string
        BL printf

exit:
        MOV X0, #0
        MOV X8, #93
        SVC 0

factorial:
        SUB SP, SP, #16         // Adjust stack for two numbers
        STR LR, [SP, #8]        // Save the return address
        STR X29, [SP, #0]       // Save the old frame pointer
        MOV X29, SP             // Set the frame pointer

        SUB SP, SP, #16         // Adjust stack for two numbers
        STR X0, [X29, #-8]        // Save the argument n
        CMP X0, #1              // Check if n < 1
        B.LT L0                 // If n < 1, return 1
        SUBS X0, X0, #1         // Decrement n
        BL factorial            // Recursive call with n-1

        // recursive calculation: n * factorial(n-1)
        LDR X1, [X29, #-8]        // Retrieve the saved n
        MUL X0, X0, X1          // Calculate n * factorial(n-1)
        ADD SP, SP, #16
        LDR LR, [SP, #8]        // Restore the return address
        LDR X29, [SP, #0]       // Restore the old frame pointer
        ADD SP, SP, #16         // adjust the stack pointer
        RET                     // go to instruction pointed by LR

L0:
        MOV X0, #1              // Base case: factorial(0) = 1
        ADD SP, SP, #16
        LDR LR, [SP, #8]
        LDR X29, [SP, #0]
        ADD SP, SP, #16  
        RET                     // go to instruction pointed by LR

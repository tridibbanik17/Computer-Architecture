.section .data
format_string:
    .asciz "The %d-th fibonacci number is: %d\n"

.section .text
.global _start
.extern printf
.extern atoi

_start:
    // Checking the number of cli args
    LDR X0, [SP]
    CMP X0, #2

    B.NE exit   // exit if the number of args is not 2

    // Loading argv[1] as a string
    LDR X0, [SP, #16]
    BL atoi     // converting the string to integer

    // Check special case of given number <= 0 
    CMP X0, #0
    B.LE exit

    // For printf
    MOV X19, X0

    BL fibonacci
    
    MOV X1, X19
    MOV X2, X0
    LDR X0, =format_string
    BL printf

    B exit
    
// Fibonacci function
// Input: X0 = n
// Output: X0 = fibonacci(n)
fibonacci:
    SUB SP, SP, #32     
    STR X19, [SP, #0]   
    STR X20, [SP, #8]   
    STR LR, [SP, #16]  
    STR X29, [SP, #24] 

    // Set the frame pointer to current stack pointer
    MOV X29, SP
    
    // Base cases (n == 0)
    CMP X0, #0
    B.EQ base0
    // Base cases (n == 1)
    CMP X0, #1
    B.EQ base1 
    
    // Recursive case: f(n) = f(n-1) + f(n-2)
    // Get f(n-1)
    STR X0, [X29, #0]   
    //MOV X19, X0   
    SUB X0, X0, #1 
    BL fibonacci
    
    // Get f(n-2)
    STR X0, [X29, #8]   
    //MOV X20, X0     
    LDR X0, [X29, #0]   
    SUB X0, X0, #2
    BL fibonacci

    // Calculate final
    LDR X20, [X29, #8] 
    ADD X0, X20, X0
    
    B restore_and_deallocate

base0:
    MOV X0, #0  // base case: fibonacci(0) = 0
    B restore_and_deallocate

base1:
    MOV X0, #1  // base case: fibonacci(1) = 1
    B restore_and_deallocate

restore_and_deallocate:
    LDR X19, [X29, #0]  
    LDR X20, [X29, #8]   
    LDR LR, [X29, #16]   
    LDR X29, [X29, #24]  
    
    ADD SP, SP, #32     // Deallocate stack memory
    RET

exit:
    MOV X0, #0
    MOV X8, #93
    SVC 0  

.section .data
format_type_check:
    .asciz "Unsigned check:\n"
format_numbers_display:
    .asciz "a = %lu\nb = %lu\n"
overflow_found:
    .asciz "Overflow found: unsigned\n"
no_overflow_found:
    .asciz "No overflow found. Operation Successful\n"

.section .text
.global check_unsigned
.extern printf

check_unsigned:
    SUB SP, SP, #16     
    STR LR, [SP, #8]   

    MOV X19, X0     
    MOV X20, X1    

    LDR X0, =format_type_check
    BL printf

    LDR X0, =format_numbers_display
    MOV X1, X19
    MOV X2, X20
    BL printf

    ADDS XZR, X19, X20     
    B.CS overflow 
    
    LDR X0, =no_overflow_found
    BL printf

    B return_results

overflow:
    LDR X0, =overflow_found
    BL printf

    B return_results  

return_results:
    LDR LR, [SP, #8]    
    ADD SP, SP, #16   
    RET

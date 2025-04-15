#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>

extern void check_unsigned(uint64_t a, uint64_t b);
extern void check_signed(int64_t a, int64_t b);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <number1> <number2>\n", argv[0]);
        return 1;
    }

    uint64_t a_unsigned = strtoull(argv[1], NULL, 10);  
    uint64_t b_unsigned = strtoull(argv[2], NULL, 10);
    int64_t a_signed = strtoll(argv[1], NULL, 10);
    int64_t b_signed = strtoll(argv[2], NULL, 10);

    check_unsigned(a_unsigned, b_unsigned);
    check_signed(a_signed, b_signed);

    return 0;
}

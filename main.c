#include <stdio.h>
#include "myMath.h"

int main() {
    double dUserNumber = 0;

    printf("Please enter a real number: ");
    // We can also use fgets in combination with strtod to read the number
    if (scanf("%lf", &dUserNumber) == EOF) {
        printf("Something went wrong with input reading, exiting...");
        return -1;
    }
    printf("The value of f(x)=e^x + x^3 for %.4f is %.4f\n", dUserNumber, add((float) Exponent((int) (dUserNumber)),
                                                                              (float) Power(dUserNumber, 3)));

    printf("The value of f(x)=3x + 2x^2 for %.4f is %.4f\n", dUserNumber, add((float) mul(dUserNumber, 3),
                                                                              (float) Power(mul(dUserNumber, 2), 2)));

    printf("The value of f(x)=(4x^3)/5 - 2x for %.4f is %.4f\n", dUserNumber,
           sub((float) div(mul(Power(dUserNumber, 3), 4), 5),
               (float) mul(dUserNumber, 2)));

    return 0;
}

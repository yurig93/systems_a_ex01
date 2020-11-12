//
// Created by Yuri Grigorian on 12/11/2020.
//

#include "power.h"
#include "basicMath.h"

double Exponent(int x) {
    return Power(CONST_EULER_NUMBER, x);
}

double Power(double x, int y) {
    double result = 1;
    int iAbsY = y >= 0 ? y : y * (-1);

    for (int i = 0; i < iAbsY; ++i) {
        result *= x;
    }

    return y < 0 ? 1 / result : result;
}
pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/comparators.circom";

// Create a Quadratic Equation( ax^2 + bx + c ) verifier using the below data.
// Use comparators.circom lib to compare results if equal

template QuadraticEquation() {
    signal input x;     // x value
    signal input a;     // coeffecient of x^2
    signal input b;     // coeffecient of x 
    signal input c;     // constant c in equation
    signal input res;   // Expected result of the equation
    signal output out;  // If res is correct , then return 1 , else 0 . 

    signal v0 <== x * x;
    signal v1 <== a * v0;
    signal total <== v1 + (b * x + c);

    out <== IsEqual()([res, total]);
    log(out);

    // We can also do the following
    // signal r <-- total == res ? 1 : 0;
    // out <== r;
}

component main  = QuadraticEquation();




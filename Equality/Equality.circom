pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/comparators.circom";

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.

template Equality() {
  signal input in[3];
  signal output out;

  component isEq = IsEqual();
  isEq.in[0] <== in[0];
  isEq.in[1] <== in[1];

  component isEq2 = IsEqual();
  isEq2.in[0] <== in[1];
  isEq2.in[1] <== in[2];

  // isEqual returns 1 when the values are equal. Which means that both equality checks must
  // be equal to 1 so all our inputs are equal.
  isEq.out * isEq2.out === 1;

  out <== isEq.out * isEq2.out;
}

component main = Equality();

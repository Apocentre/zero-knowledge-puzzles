pragma circom 2.1.6;


// Input : a , length of 2 .
// Output : c .
// In this exercise , you have to check that a[0] is NOT equal to a[1], if not equal, output 1, else output 0.
// You are free to use any operator you may like . 

// HINT:NEGATION

include "../node_modules/circomlib/circuits/comparators.circom";

template NotEqual() {
  signal input in[2];
  signal output out;

  component isEq = IsEqual();
  isEq.in[0] <== in[0];
  isEq.in[1] <== in[1];

  signal result <-- isEq.out == 1 ? 0 : 1;
  log(result);
  
  out <== result;
}

component main = NotEqual();

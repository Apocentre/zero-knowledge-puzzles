pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/comparators.circom";

// Input 3 values using 'a'(array of length 3) and check if they all are equal.
// Return using signal 'c'.
template EqualityN(n) {
  signal input in[n];
  signal output out;

  var result;
  result = 1;

  for(var i = 0; i < n - 1; i++){
    var tmp = in[i] == in[i + 1] ? 1 : 0;
    result = result * tmp;
  }

  signal r <-- result;
  component isEq = IsEqual();
  isEq.in[0] <== 1;
  isEq.in[1] <== r;

  isEq.out === 1;

  out <== r;
}

component main = EqualityN(8);

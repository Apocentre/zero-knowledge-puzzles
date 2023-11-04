pragma circom 2.1.6;

// In this exercise , we will learn how to check the range of a private variable and prove that 
// it is within the range . 

// For example we can prove that a certain person's income is within the range
// Declare 3 input signals `a`, `lowerbound` and `upperbound`.
// If 'a' is within the range, output 1 , else output 0 using 'out'

include "../node_modules/circomlib/circuits/comparators.circom";


template Range() {
  signal input a;
  signal input low;
  signal input high;

  signal output out;

  component gt = GreaterThan(32);
  gt.in[0] <== a;
  gt.in[1] <== low;

  component lt = LessThan(32);
  lt.in[0] <== a;
  lt.in[1] <== high;

  log("Greater Than", gt.out);
  log("Less Than", lt.out);
  log("Is in range", gt.out * lt.out);

  // Add constraint to make sure a in in range.
  // GreaterThan return 1 if in[0] is greater (of smaller than in case of LessThan) than in[1].
  // If both are 1 then a is the provided range.
  1 === gt.out * lt.out;

  // we can optionally return. This will work only if a is in range. Otherwise witness generation will fail in the line above.
  out <== gt.out * lt.out;
  
}

component main  = Range();



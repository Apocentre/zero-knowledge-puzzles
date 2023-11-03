pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/poseidon.circom";
// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 
template poseidon() {
  signal input a;
  signal input b;
  signal input c;
  signal input d;
  
  // expected hash
  signal input hashValue;
  
  signal output out;

  component hash = Poseidon(4);
  hash.inputs <== [a, b, c, d];

  hash.out === hashValue;
}

component main {public [hashValue]} = poseidon();

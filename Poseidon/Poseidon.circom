pragma circom 2.1.6;

include "../node_modules/circomlib/circuits/poseidon.circom";
// Go through the circomlib library and import the poseidon hashing template using node_modules
// Input 4 variables,namely,'a','b','c','d' , and output variable 'out' .
// Now , hash all the 4 inputs using poseidon and output it . 
template poseidon() {
  // We can write the code below in a very concise way like this
  // signal input a, b, c, d;
  // signal output out <== Poseidon(4)([a,b,c,d]);

  signal input a;
  signal input b;
  signal input c;
  signal input d;
  
  signal output out;

  component hash = Poseidon(4);
  hash.inputs[0] <== a;
  hash.inputs[1] <== b;
  hash.inputs[2] <== c;
  hash.inputs[3] <== d;

  log(hash.out);

  out <== hash.out;
}

component main = poseidon();

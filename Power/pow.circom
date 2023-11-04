pragma circom 2.1.4;

// Create a circuit which takes an input 'a',(array of length 2 ) , then  implement power modulo 
// and return it using output 'c'.

// HINT: Non Quadratic constraints are not allowed. 

template Pow() {
  signal input in[2];
  signal output out;

  // This an arithemtic operation that is equal to (in[0]^in[2]) mod p
  // In circom all arithmetic operators applied to numeric values work modulo p where
  // p = 21888242871839275222246405745257275088548364400416034343698204186575808495617
  signal r <-- in[0] ** in[1];
  
  out <== r;
}

template Main() {
  signal input in[2];

  component p = Pow();
  p.in <== in;
  log(p.out);
}

component main = Main();


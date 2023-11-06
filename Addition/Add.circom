pragma circom 2.1.6;


// In this exercise , you need to create a circuit that takes an array "a"
// of length '2' as input and a output "c" .
// Create a circuit that adds the 2 inputs and outputs it .

template Add() {
  signal input in[2];
  signal output out;

  out <== in[0] + in[1];
}

component main {public [in]}  = Add();


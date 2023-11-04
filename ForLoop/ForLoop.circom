pragma circom 2.1.6;

// Input : 'a',array of length 2 .
// Output : 'c 
// Using a forLoop , add a[0] and a[1] , 4 times in a row .

template ForLoop() {
  signal input in[2];
  signal output out;

  var sum = 0;
  for (var i = 0; i < 4; i++) {
    sum += in[0] + in[1];
  }

  log(sum);

  out <== sum;
}  

component main = ForLoop();

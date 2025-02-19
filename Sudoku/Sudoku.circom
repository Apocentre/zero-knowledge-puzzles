pragma circom 2.1.4;

include "../node_modules/circomlib/circuits/comparators.circom";


/*
    Given a 4x4 sudoku board with array signal input "question" and "solution", check if the solution is correct.

    "question" is a 16 length array. Example: [0,4,0,0,0,0,1,0,0,0,0,3,2,0,0,0] == [0, 4, 0, 0]
                                                                                   [0, 0, 1, 0]
                                                                                   [0, 0, 0, 3]
                                                                                   [2, 0, 0, 0]

    "solution" is a 16 length array. Example: [1,4,3,2,3,2,1,4,4,1,2,3,2,3,4,1] == [1, 4, 3, 2]
                                                                                   [3, 2, 1, 4]
                                                                                   [4, 1, 2, 3]
                                                                                   [2, 3, 4, 1]

    "out" is the signal output of the circuit. "out" is 1 if the solution is correct, otherwise 0.                                                                               
*/


template Sudoku () {
  // Question Setup 
  signal input  question[16];
  signal input solution[16];
  signal output out;
  
  // Checking if the question is valid
  for(var v = 0; v < 16; v++){
    // log(solution[v], question[v]);
    assert(question[v] == solution[v] || question[v] == 0);
  }
  
  var m = 0 ;
  component row1[4];
  for(var q = 0; q < 4; q++){
    row1[m] = IsEqual();
    row1[m].in[0]  <== question[q];
    row1[m].in[1] <== 0;
    m++;
  }
  3 === row1[3].out + row1[2].out + row1[1].out + row1[0].out;

  m = 0;
  component row2[4];
  for(var q = 4; q < 8; q++){
    row2[m] = IsEqual();
    row2[m].in[0]  <== question[q];
    row2[m].in[1] <== 0;
    m++;
  }
  3 === row2[3].out + row2[2].out + row2[1].out + row2[0].out; 

  m = 0;
  component row3[4];
  for(var q = 8; q < 12; q++){
    row3[m] = IsEqual();
    row3[m].in[0]  <== question[q];
    row3[m].in[1] <== 0;
    m++;
  }
  3 === row3[3].out + row3[2].out + row3[1].out + row3[0].out; 

  m = 0;
  component row4[4];
  for(var q = 12; q < 16; q++){
    row4[m] = IsEqual();
    row4[m].in[0]  <== question[q];
    row4[m].in[1] <== 0;
    m++;
  }
  3 === row4[3].out + row4[2].out + row4[1].out + row4[0].out; 

  // Write your solution from here.. Good Luck!
  var sumRow[4];
  var sumCol[4];

  // The sum of each row and column must be equal to 10
  for (var row = 0; row < 4; row++){
    for (var col = 0; col < 4; col++){
      var index = row * 4 + col;
      sumRow[row] += solution[index];
      sumCol[col] += solution[index]; 
    }
  }

  // Check that the sum of all each row is 10
  component rowEq[4];
  var rowAnswerTotal;
  for (var row = 0; row < 4; row++){
    rowEq[row] = IsEqual();
    rowEq[row].in <== [sumRow[row], 10];
    rowAnswerTotal += rowEq[row].out;
  }

  // Check that the sum of all each column is 10 as well
  component colEq[4];
  var colAnswerTotal;
  for (var col = 0; col < 4; col++){
    colEq[col] = IsEqual();
    colEq[col].in <== [sumCol[col], 10];
    colAnswerTotal += colEq[col].out;
  }

  // rowAnswerTotal(and colAnswerTotal) must have a total of 4 because we want all 
  // for all rows (cols) to have the isEqual.out value to be 1 i.e. the sum is 10
  signal r <-- rowAnswerTotal + colAnswerTotal == 8 ? 1 : 0;
  out <== r;

  log(out);
}


component main = Sudoku();


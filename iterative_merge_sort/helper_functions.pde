void startSim() { // this starts the simulation 
  //for (int i = 0; i < array.length; i++) {
    int x = startX;
    int y = startY - (textSize + padding);
    arrowX = startX - 2*(textSize+padding);
    arrowY = y + 20;
    fill(0);
    textAlign(LEFT, CENTER);
    //if ( i == array.length-1) {
    //  text(orgArray[i], x + textSize / 2, y + textSize / 2);
    //} else {
    //  text(orgArray[i] +", ", x + textSize / 2, y + textSize / 2);
    //}
    text(org, x + textSize / 2, y + textSize / 2);
  //}
  arrowX = startX - 2*(textSize+padding);
  arrowY = startY - (textSize + padding) + 20;
  textAlign(CENTER, CENTER);
  text("Orginal Array", arrowX - (arrowSize+padding), arrowY - 10);
  triangle(arrowX + arrowSize / 2+30, arrowY-5, arrowX + arrowSize / 4+30, arrowY - arrowSize / 4-5, arrowX + arrowSize / 4+30, arrowY + arrowSize / 4-5);
  line(arrowX - arrowSize / 2 +30, arrowY-5, arrowX + arrowSize / 2 +30, arrowY-5);
}



String printArray(int A[], int size) {// change the printArray function so it is easier to debug
  String output = "";
  for (int i = 0; i < size; i++) {
    if (A.length == 1) {
    output += (A[i]);
    }
    else if ( i == size-1){
      output += (A[i]);
    }
    else {
    output += (A[i] + ", ");
    }
  }
  return output;
}

void printArray(int A[][], int size) { // same thing here but with 2D array
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      print(A[i][j] + " ");
    }
    println();
  }
}

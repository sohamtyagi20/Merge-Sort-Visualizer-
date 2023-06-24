void startSim() {
  for (int i = 0; i < array.length; i++) {
    int x = startX + i * (textSize + padding);
    int y = startY - (textSize + padding);
    arrowX = startX - 2*(textSize+padding);
    arrowY = y + 20;
    fill(0);
    textAlign(CENTER, CENTER);
    text(orgArray[i] +", ", x + textSize / 2, y + textSize / 2);
  }
  arrowX = startX - 2*(textSize+padding);
  arrowY = startY - (textSize + padding) + 20;
  text("Orginal Array", arrowX - 150, arrowY - 10);
  triangle(arrowX + arrowSize / 2, arrowY, arrowX + arrowSize / 4, arrowY - arrowSize / 4, arrowX + arrowSize / 4, arrowY + arrowSize / 4);
  line(arrowX - arrowSize / 2, arrowY, arrowX + arrowSize / 2, arrowY);
}
void printArray(int A[], int size) {
  for (int i = 0; i < size; i++) {
    print(A[i] + " ");
  }
  println();
}

void printArray(int A[][], int size) {
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      print(A[i][j] + " ");
    }
    println();
  }
}

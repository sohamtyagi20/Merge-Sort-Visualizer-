import java.util.Arrays;

int textSize = 30;
int padding = 20; 
int startX, startY;  
float arrowX;
float arrowY;
float arrowSize = 100;
int i = 0;
int j = 0;

int array[] = {12, 11, 13, 5, 6, 7, 8, 4};
final int[] orgArray = Arrays.copyOf(array, array.length);
int[] mergedArray = new int[array.length];
int[][] mergeSteps = new int[array.length][array.length ];
String[] textMergeSteps = new String[array.length];
//ArrayList<String[]> preMerge = new ArrayList <String[]>() ;
String[][] preMerge = new String[array.length][array.length];
int stage = 0;
int stepIter = 0;
int steps = 0;

void setup() {
  frameRate(1);
  //noLoop();
  size(1000, 500);
  textSize(textSize);
  startX = (width - (array.length * (textSize + padding) - padding)) / 2;
  startY = height / 2 - textSize / 2 - padding - 150;
  MergeSort sort = new MergeSort(array);

  println("Given array is:");
  printArray(array, sort.n);
  println();

  sort.callMergeSort();
  //printArray(mergeSteps[1], array.length);


  println("\nSorted array is:");
  printArray(array, sort.n);
}
void draw() {
  background(255);
  if (stage == 0) {
    startSim();
  } else {
    startSim();
    if ( i == array.length - 2) {
      noLoop();
    }
    //while (steps != array.length) {
    //for (int i = 0; i < array.length; i++) {    
    textMergeSteps[i] = Arrays.toString(mergeSteps[i]);
    textMergeSteps[i] = textMergeSteps[i].replace("[", "").replace("]", "");
    //println(mergeSteps[i]);    
    int x = startX;
    int y = startY + i*(textSize + padding);
    arrowX = startX - 2*(textSize+padding);
    arrowY = y + 20;
    if ( i > 0 ) {
      preMerge[i][j] = textMergeSteps[i-1];
      //while() {
      for ( int a = 0; a < i; a++) {
        for ( int b = 0; b < j; b++) {
        fill(0);
        textAlign(LEFT, CENTER);
        text(preMerge[a][b], x + textSize / 2, (startY + (i-1)*(textSize + padding)) + textSize / 2 );
        }
      }
      j++;
      //}
    }
    fill(0);
    textAlign(LEFT, CENTER);
    text(textMergeSteps[i], x + textSize / 2, y + textSize / 2);
    if (i == array.length -2) {
      triangle(arrowX + arrowSize / 2, arrowY, arrowX + arrowSize / 4, arrowY - arrowSize / 4, arrowX + arrowSize / 4, arrowY + arrowSize / 4);
      line(arrowX - arrowSize / 2, arrowY, arrowX + arrowSize / 2, arrowY);
      text("Final Array", arrowX - 250, arrowY -10 );
    }
    i++;
    steps++;
    //}
    //}
    //noLoop();
  }
  stage++;
}

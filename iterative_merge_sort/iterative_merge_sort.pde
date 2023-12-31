import java.util.Arrays;
import g4p_controls.*;

int array[] = {2, 12, 11, 5, 6, 7, 54, 21 , 32}; // the array that will be sorted
String org = Arrays.toString(array);

int textSize = 20; // sets the text size
int padding = 20; 
int startX, startY;  
float arrowX; // x and y value for arrow
float arrowY;
float arrowSize = 60;
int i = 0; // this will be used as an intrement in draw
int j = 0;
float frame = 1;


final int[] orgArray = Arrays.copyOf(array, array.length); // makes a copy of the orginal code
int[][] mergeSteps = new int[array.length][array.length]; // to get a copy of every step made in merge sort
String[] textMergeSteps = new String[array.length]; // to print it to window
String[][] preMerge = new String[array.length][array.length]; // to show the steps on screen
String[] tempArray = new String[array.length]; // used to show the merging
String[] brack;
int stage = 0;
int stepIter = 0;
int elseChecker = 0;
boolean pause = true; // for GUI

void setup() {
  println(org);
  G4P.messagesEnabled(false);
  createGUI();
  frameRate(frame);
  noLoop();
  size(800, 600);
  //if ( array.length % 2 == 0){
  //  brack = new String[3];
  //}
  //else {
  //brack  = new String[2];
  //}

  startX = (width - (array.length * (textSize + padding) - padding)) / 2 ; //formating 
  startY = height / 2 - textSize / 2 - padding-(height/6); 

  MergeSort sort = new MergeSort(array);
  sort.callMergeSort();
  String [] stringArray = new String[tempArray.length];
  int count = 0;

  for (String element : tempArray) {
    if (element != null) {
      stringArray[count] = element;
      count++;
    }
  }

  // Create a new array with the correct size, without null elements
   brack = new String[count];
  System.arraycopy(stringArray, 0, brack, 0, count);

}
void draw() {
  background(255);    
  fill(0);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("Merge Sort Visualizer", width/2, height/9);
  textSize(textSize);
  if (stage == 0) {
    startSim();
  } else {
    startSim();
    if ( i == array.length - 2) { // to stop werid bug from happening
      noLoop();
    }
    if ( i < brack.length) {
      int x = startX;
      int y = startY + i*(textSize + padding);
      arrowX = startX - 2*(textSize+padding);
      arrowY = y + 20;
      if ( i > 0 ) { // checks if i is bigger than 0, if true then it make a copy of the previous merge step
        preMerge[i][j] = brack[i-1];
        int b = 0;
        int e = 0;
        for ( int a = 1; a < i+1; a++) {
          b = a -1;
          fill(0);
          textAlign(LEFT, CENTER);
          text(preMerge[a][b], x + textSize / 2, (startY + e*(textSize + padding)) + textSize / 2 );
          e ++;
        }
        j++;
      }    
      fill(0);
      textAlign(LEFT, CENTER);
      text(brack[i], x + textSize / 2, y + textSize / 2);
    } else {
      if (elseChecker == 0) {
        textMergeSteps[i-1] = brack[i-1];
        elseChecker++;
      }
      textMergeSteps[i] = Arrays.toString(mergeSteps[i]);



      int x = startX;
      int y = startY + i*(textSize + padding);
      arrowX = startX - 2*(textSize+padding);
      arrowY = y + 20;
      if ( i > 0 ) { // checks if i is bigger than 0, if true then it make a copy of the previous merge step
        preMerge[i][j] = textMergeSteps[i-1];
        int b = 0;
        int e = 0;
        for ( int a = 1; a < i+1; a++) {
          b = a -1;
          fill(0);
          textAlign(LEFT, CENTER);
          text(preMerge[a][b], x + textSize / 2, (startY + e*(textSize + padding)) + textSize / 2 );
          e ++;
        }
        j++;
      }
      fill(0);
      textAlign(LEFT, CENTER);
      text(textMergeSteps[i], x + textSize / 2, y + textSize / 2);    
      if (i == array.length -2) { // for the arrow, only runs when the sorted array is printed to the screen
        triangle(arrowX + arrowSize / 2 + 45, arrowY, arrowX + arrowSize / 4 + 45, arrowY - arrowSize / 4, arrowX + arrowSize / 4 + 45, arrowY + arrowSize / 4);
        line(arrowX - arrowSize / 2+45, arrowY, arrowX + arrowSize / 2+45, arrowY);
        text("Final Array", arrowX - (arrowSize+padding)-10, arrowY -10 );
      }
    }
    i++;
  }
  stage++;
}

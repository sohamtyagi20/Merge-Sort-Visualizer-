class MergeSort {
  int[] array;
  int n;
  MergeSort (int[] a) {
    this.array = a;
    n = a.length;
  }
  void callMergeSort() {
    mergeSort(array, n);
  }

  void mergeSort(int array[], int n) { // Iterative Merge Sort
    int f = 0;
    for (int curr_size = 1; curr_size <= n - 1; curr_size = 2 * curr_size) { // Outer loop controls the size of the subarrays
      String res = "";

      for (int left_start = 0; left_start < n - 1; left_start += 2 * curr_size) {
        // Inner loop iterates over the subarrays

        int mid = min(left_start + curr_size - 1, n - 1); // Calculate the mid and right_end points for merging
        int right_end = min(left_start + 2 * curr_size - 1, n - 1);

        res += merge(array, left_start, mid, right_end);
        brack[f] = res;
        for ( int a  = 0; a < this.array.length; a++) { // Stores the steps of the merging proccess to mergSteps
          if ( stepIter >= 10) {
            stepIter--;
          }
          mergeSteps[stepIter][a] = array[a];
        }
        stepIter++;
      }
      f++;
    }
  }

  String merge(int array[], int l, int m, int r) {
    int i, j, k;
    // Calculate the sizes of the subarrays
    int n1 = m - l + 1;
    int n2 = r - m;


    int L[] = new int[n1];
    int R[] = new int[n2];

    for (i = 0; i < n1; i++) {
      L[i] = array[l + i];
    }
    for (j = 0; j < n2; j++) {
      R[j] = array[m + 1 + j];
    }

    i = 0;
    j = 0;
    k = l;
    while (i < n1 && j < n2) {
      if (L[i] <= R[j]) {
        array[k] = L[i];
        i++;
      } else {
        array[k] = R[j];
        j++;
      }
      k++;
    }

    while (i < n1) {
      array[k] = L[i];
      i++;
      k++;
    }

    while (j < n2) {
      array[k] = R[j];
      j++;
      k++;
    }
    // This is used to show the brackets during the merging process 
    String tempGroups = ""; 
    tempGroups += "["+printArray(L, L.length)+"]";
    tempGroups += "["+printArray(R, R.length)+"]";
    if (tempGroups.matches(".*\\[\\].*")) {
      tempGroups = tempGroups.replaceAll("\\[\\]", "");
    }
    return tempGroups;
  }
}

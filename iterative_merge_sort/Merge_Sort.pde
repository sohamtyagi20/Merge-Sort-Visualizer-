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
    for (int curr_size = 1; curr_size <= n - 1; curr_size = 2 * curr_size) { // Outer loop controls the size of the subarrays
      for (int left_start = 0; left_start < n - 1; left_start += 2 * curr_size) { // Inner loop iterates over the subarrays
        int mid = min(left_start + curr_size - 1, n - 1); // Calculate the mid and right_end points for merging
        int right_end = min(left_start + 2 * curr_size - 1, n - 1);
        merge(array, left_start, mid, right_end);
        //printArray(array, n);
        for ( int i  = 0; i < this.array.length; i++) { // Stores the steps of the merging proccess to mergSteps
          mergeSteps[stepIter][i] = array[i];
        }
        stepIter++;
      }
    }
  }

  void merge(int array[], int l, int m, int r) {
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
  }
}

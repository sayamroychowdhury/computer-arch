// 😎️C program to implement Quick sort

#include <stdio.h>
void swap(int *a, int *b) {
  int t = *a;
  *a = *b;
  *b = t;
}

int partition(int array[], int low, int high) {
  
	int pivot = array[high];
	int i = (low - 1);
	for (int j = low; j < high; j++) {
		if (array[j] <= pivot) {
		i++;
		swap(&array[i], &array[j]);
		}
	}
	swap(&array[i + 1], &array[high]);
  	return (i + 1);
}

void quickSort(int array[], int low, int high) {
	if (low < high) {
		int pi = partition(array, low, high);
		quickSort(array, low, pi - 1);
		quickSort(array, pi + 1, high);
  }
}

int main() {
	int size,i; 
	printf("Enter the size of array ");
	scanf("%d", &size);
	int arr[size];
	printf("Enter the elements of the array ");
	for (i = 0; i<size; i++){
    		scanf("%d", &arr[i]);
	}
	printf("Given array is \n");
	for (i = 0; i < size; i++)
	printf("%d ", arr[i]);
	printf("\n");
	quickSort(arr, 0, size - 1);
	printf("Sorted array: \n");
	for (i = 0; i < size; i++)
	printf("%d ", arr[i]);
	return 0;
}

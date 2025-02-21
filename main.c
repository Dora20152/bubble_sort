#include <stdio.h>
#include <string.h>
#include <ctype.h>

void bubbleSort(int arr[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }
}

void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int isInteger(const char *str) {
    if (*str == '0') return 0;
    if (*str == '-') str++;
    while (*str) {
        if (!isdigit(*str)) return 0;
        str++;
    }
    return 1;
}

int main() {
    int n;

    while (1) {
        printf("Введите количество элементов в массиве (положительное число): ");
        char input[20];
        scanf("%s", input);

        if (!isInteger(input) || (n = atoi(input)) <= 0 || n > 100) {
            printf("Ошибка: введите корректное положительное число (1-100).\n");
        } else {
            break;
        }
    }

    int arr[n];

    printf("Введите элементы массива (целые числа):\n");
    for (int i = 0; i < n; i++) {
        while (1) {
            char input[20];
            scanf("%s", input);

            if (!isInteger(input)) {
                printf("Ошибка: введите целое число.\n");
            } else {
                arr[i] = atoi(input);
                break;
            }
        }
    }

    printf("Исходный массив: \n");
    printArray(arr, n);
    
    bubbleSort(arr, n);
    
    printf("Отсортированный массив: \n");
    printArray(arr, n);
    
    return 0;
}

#!/bin/bash

# Запуск тестов
echo "Тестирование программы..."

# Пример теста: проверка сортировки массива
echo -e "5\n3\n1\n4\n2\n" | ./bubble_sort_program > output.txt

if diff output.txt <(echo -e "Исходный массив: \n1 2 3 4 5 \nОтсортированный массив: \n1 2 3 4 5 \n"); then
    echo "Тест сортировки прошел успешно."
else
    echo "Тест сортировки не пройден."
    exit 1
fi

# Пример теста: проверка массива с одинаковыми элементами
echo -e "5\n7\n7\n7\n7\n7\n" | ./bubble_sort_program > output_duplicates.txt

if diff output_duplicates.txt <(echo -e "Исходный массив: \n7 7 7 7 7 \nОтсортированный массив: \n7 7 7 7 7 \n"); then
    echo "Тест массива с дубликатами прошел успешно."
else
    echo "Тест массива с дубликатами не пройден."
    exit 2
fi

# Пример теста: проверка сортировки уже отсортированного массива
echo -e "5\n1\n2\n3\n4\n5\n" | ./bubble_sort_program > output_sorted.txt

if diff output_sorted.txt <(echo -e "Исходный массив: \n1 2 3 4 5 \nОтсортированный массив: \n1 2 3 4 5 \n"); then
    echo "Тест уже отсортированного массива прошел успешно."
else
    echo "Тест уже отсортированного массива не пройден."
    exit 3
fi

# Пример теста: проверка некорректного ввода (нецелое число)
echo -e "5\na\n1\n2\n3\n4\n5\n" | ./bubble_sort_program > output_invalid_input.txt

if grep -q "Ошибка: введите целое число." output_invalid_input.txt; then
    echo "Тест некорректного ввода прошел успешно."
else
    echo "Тест некорректного ввода не пройден."
    exit 4
fi

# Пример теста: проверка некорректного ввода (негативное число)
echo -e "5\n-1\n2\n3\n4\n5\n" | ./bubble_sort_program > output_negative_input.txt

if grep -q "Ошибка: введите корректное положительное число (1-100)." output_negative_input.txt; then
    echo "Тест некорректного ввода (негативное число) прошел успешно."
else
    echo "Тест некорректного ввода (негативное число) не пройден."
    exit 5
fi

# Пример теста: проверка превышения максимального размера массива
echo -e "105\n1\n2\n3\n4\n5\n" | ./bubble_sort_program > output_large_input.txt

if grep -q "Ошибка: введите корректное положительное число (1-100)." output_large_input.txt; then
    echo "Тест превышения максимального размера массива прошел успешно."
else
    echo "Тест превышения максимального размера массива не пройден."
    exit 6
fi

# Вывод итогового результата
echo "Все тесты завершены."

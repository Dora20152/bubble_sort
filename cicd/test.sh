#!/bin/bash

# Запуск тестов
echo "Тестирование программы..."

# Тест 1: проверка сортировки массива
input="5\n3\n1\n4\n2\n7\n"
expected_output="Исходный массив: 
3 1 4 2 7 
Отсортированный массив: 
1 2 3 4 7"

output=$(echo -e "$input" | ./bubble_sort_program | grep -v "Введите количество элементов" | grep -v "Введите элементы массива")

if [ "$output" == "$expected_output" ]; then
    echo "Тест 1 прошел успешно."
else
    echo "Тест 1 не пройден."
    echo "Ожидаемый вывод:"
    echo -e "$expected_output"
    echo "Фактический вывод:"
    echo "$output"
    exit 1
fi

# Тест 2: проверка массива с одинаковыми элементами
input="5\n7\n7\n7\n7\n7\n"
expected_output="Исходный массив: 
7 7 7 7 7 
Отсортированный массив: 
7 7 7 7 7"

output=$(echo -e "$input" | ./bubble_sort_program | grep -v "Введите количество элементов" | grep -v "Введите элементы массива")

if [ "$output" == "$expected_output" ]; then
    echo "Тест 2 прошел успешно."
else
    echo "Тест 2 не пройден."
    echo "Ожидаемый вывод:"
    echo -e "$expected_output"
    echo "Фактический вывод:"
    echo "$output"
    exit 2
fi

# Тест 3: проверка сортировки уже отсортированного массива
input="5\n1\n2\n3\n4\n5\n"
expected_output="Исходный массив: 
1 2 3 4 5 
Отсортированный массив: 
1 2 3 4 5"

output=$(echo -e "$input" | ./bubble_sort_program | grep -v "Введите количество элементов" | grep -v "Введите элементы массива")

if [ "$output" == "$expected_output" ]; then
    echo "Тест 3 прошел успешно."
else
    echo "Тест 3 не пройден."
    echo "Ожидаемый вывод:"
    echo -e "$expected_output"
    echo "Фактический вывод:"
    echo "$output"
    exit 3
fi

# Тест 4: проверка некорректного ввода (нецелое число)
output_invalid=$(echo -e "5\na\n1\n2\n3\n4\n5\n" | ./bubble_sort_program)
if echo "$output_invalid" | grep -q "Ошибка: введите целое число."; then
    echo "Тест 4 некорректного ввода прошел успешно."
else
    echo "Тест 4 некорректного ввода не пройден."
    exit 4
fi

# Тест 5: проверка превышения максимального размера массива
output_large_input=$(echo -e "105\n1\n2\n3\n4\n5\n" | ./bubble_sort_program)
if echo "$output_large_input" | grep -q "Ошибка: введите корректное положительное число (1-100)."; then
    echo "Тест 5 превышения максимального размера массива прошел успешно."
else
    echo "Тест 5 превышения максимального размера массива не пройден."
    exit 5
fi

# Вывод итогового результата
echo "Все тесты завершены."

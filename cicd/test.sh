#!/bin/bash

# Запуск тестов
echo "Тестирование программы..."

# Функция для выполнения теста
run_test() {
    input="$1"
    expected_output="$2"
    output_file="$3"

    # Запуск программы с вводом
    echo -e "$input" | ./bubble_sort_program | grep -v "Введите количество элементов" | grep -v "Введите элементы массива" > "$output_file"

    # Проверка результата
    if diff "$output_file" <(echo -e "$expected_output"); then
        echo "Тест прошел успешно."
    else
        echo "Тест не пройден."
        exit 1
    fi
}

# Пример теста: проверка сортировки массива
run_test "5\n3\n1\n4\n2\n7\n" "Исходный массив: \n3 1 4 2 7 \nОтсортированный массив: \n1 2 3 4 7 \n" "output.txt"

# Пример теста: проверка массива с одинаковыми элементами
run_test "5\n7\n7\n7\n7\n7\n" "Исходный массив: \n7 7 7 7 7 \nОтсортированный массив: \n7 7 7 7 7 \n" "output_duplicates.txt"

# Пример теста: проверка сортировки уже отсортированного массива
run_test "5\n1\n2\n3\n4\n5\n" "Исходный массив: \n1 2 3 4 5 \nОтсортированный массив: \n1 2 3 4 5 \n" "output_sorted.txt"

# Пример теста: проверка некорректного ввода (нецелое число)
echo -e "5\na\n1\n2\n3\n4\n5\n" | ./bubble_sort_program | grep -v "Введите количество элементов" | grep -v "Введите элементы массива" > output_invalid_input.txt

if grep -q "Ошибка: введите целое число." output_invalid_input.txt; then
    echo "Тест некорректного ввода прошел успешно."
else
    echo "Тест некорректного ввода не пройден."
    exit 4
fi

# Пример теста: проверка превышения максимального размера массива
echo -e "105\n1\n2\n3\n4\n5\n" | ./bubble_sort_program | grep -v "Введите количество элементов" | grep -v "Введите элементы массива" > output_large_input.txt

if grep -q "Ошибка: введите корректное положительное число (1-100)." output_large_input.txt; then
    echo "Тест превышения максимального размера массива прошел успешно."
else
    echo "Тест превышения максимального размера массива не пройден."
    exit 6
fi

# Вывод итогового результата
echo "Все тесты завершены."

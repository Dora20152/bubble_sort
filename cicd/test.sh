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
    exit 1
fi

# Пример теста: проверка сортировки уже отсортированного массива
echo -e "5\n1\n2\n3\n4\n5\n" | ./bubble_sort_program > output_sorted.txt

if diff output_sorted.txt <(echo -e "Исходный массив: \n1 2 3 4 5 \nОтсортированный массив: \n1 2 3 4 5 \n"); then
    echo "Тест уже отсортированного массива прошел успешно."
else
    echo "Тест уже отсортированного массива не пройден."
    exit 1
fi

# Пример теста: проверка некорректного ввода (нецелое число)
echo -e "5\na\n1\n2\n3\n4\n5\n" | ./bubble_sort_program > output_invalid_input.txt

if diff output_invalid_input.txt <(echo -e "Ошибка: введите целое число.\nИсходный массив: \n1 2 3 4 5 \nОтсортированный массив: \n1 2 3 4 5 \n"); then
    echo "Тест некорректного ввода прошел успешно."
else
    echo "Тест некорректного ввода не пройден."
    exit 1
fi

# Вывод итогового результата
echo "Все тесты завершены."

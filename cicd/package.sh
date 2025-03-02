#!/bin/bash

# Создание необходимых директорий
mkdir -p bubble_sort/DEBIAN
mkdir -p bubble_sort/usr/bin

# Копирование исполняемого файла
cp path/to/your/bubble_sort_program bubble_sort/usr/bin/

# Создание файла control
cat <<EOF > bubble_sort/DEBIAN/control
Package: bubble-sort-program
Version: 1.0
Section: base
Priority: optional
Architecture: amd64
Depends: 
Description: Программа сортировки массива с использованием пузырьковой сортировки.
EOF

# Упаковка в deb-пакет
dpkg-deb --build bubble_sort

# Удаление временной директории
rm -rf bubble_sort

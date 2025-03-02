#!/bin/bash

# Упаковка в deb-пакет
mkdir -p package/usr/bin
cp bubble_sort_program package/usr/bin/

# Создание необходимых директорий для deb-пакета
mkdir -p package/DEBIAN

# Создание файла контроля
cat <<EOF > package/DEBIAN/control
Package: bubble-sort-program
Version: 1.0
Section: base
Priority: optional
Architecture: amd64
Depends: 
Description: Программа сортировки массива с использованием пузырьковой сортировки.
EOF

# Упаковка в deb-пакет
dpkg-deb --build package

# Удаление временной директории
rm -rf package

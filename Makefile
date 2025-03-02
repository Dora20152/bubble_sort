CC = gcc
CFLAGS = -Wall -Wextra -std=c11
TARGET = bubble_sort_program
SRCS = main.c
OBJS = $(SRCS:.c=.o)

# Задача по умолчанию
all: $(TARGET)

# Линковка объектных файлов в исполняемый файл
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Правило компиляции для создания объектных файлов
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Очистка объектных файлов и исполняемого файла
clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean

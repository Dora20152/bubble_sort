   # Используем базовый образ Ubuntu
   FROM ubuntu:latest

   # Устанавливаем необходимые зависимости
   RUN apt-get update && apt-get install -y 
       wget 
       && rm -rf /var/lib/apt/lists/*

   # Копируем .deb пакет в образ
   COPY bubble_sort.deb /tmp/

   # Устанавливаем .deb пакет
   RUN dpkg -i /tmp/bubble_sort.deb || apt-get install -f

   # Задаем команду для запуска вашего ПО
   CMD ["./bubble_sort_program", "3","25","1","10"]
   

print("Введите ваше имя\n")
str=gets
print("Здравствуй, ",str)
print("Какой язык у вас любимый?\n")
str2=gets
str2.chomp!
case str2
when "ruby","Ruby"
  print("Ты Подлиза")
when "c","C"
  print("Скоро будет Ruby")
when "python","Python"
  print("Позер!!")
when "php","PHP"
  print("Зачем?")
when "Java","java"
  print("Уважаем")
else
  print("Лучше учи Ruby")

end

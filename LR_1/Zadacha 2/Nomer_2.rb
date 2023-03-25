#Вариант № 5.
# Метод 1. Найти количество делителей числа, не делящихся на 3.
# Метод 2. Найти минимальную нечетную цифру числа.
# Метод 3. Найти сумму всех делителей числа, взаимно простых с суммой
# цифр числа и не взаимно простых с произведением цифр числа.
#взаимно простые
def nod(m, n)
  while !((m==0)||(n==0))
    if m>=n
      m =m-n
    else
      n = n-m
    end
  end
  k = (m==0? n:m)
  k
end

#Кол-во делителей числа, не делящихся на 3
def kol_del(number)
  kol = 0
  number.downto(1).each{|div| kol+= 1 if (number % div).zero? && !(div % 3).zero? }
  kol
end

#Минимальная нечетная цифра числа
def min_nechet_cifra(number)
  chislo = 0
  min = 9
  number.digits.each {|dig| chislo = dig  if dig <= min && !(dig % 2).zero? }
  chislo
end

#Найти сумму всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа.
def sum_del(number)
  sum = 0
  mul = 1
  sum_div = 0
  number.downto(1).each {|div| sum+= div if (number % div).zero? }
  number.downto(2).each {|div| mul*= div if (number % div).zero? }
  number.downto(3).each {|div| sum_div+= div if (nod(div,sum)==1) && (nod(div,mul)!=1) }
  sum_div
end

puts 'Введите число:'
x = $stdin.gets.to_i
puts "Кол-во делителей числа, не делящихся на 3: #{kol_del(x)}"
puts "Минимальная нечетная цифра числа: #{min_nechet_cifra(x)}"
puts "Сумма всех делителей числа, взаимно простых с суммой цифр числа и не взаимно простых с произведением цифр числа: #{sum_del(x)}"


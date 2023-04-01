#Минимальный элемент(0)
def min_elem(ar)
  return nil if ar.empty?

  min= ar[0]
  for i in ar
    min=i if i < min
  end
  min
end

#Номер первого положительного элемента(1)
def positive_number(ar)
  return nil if ar.empty?
  n=0
  while ar[n]<=0
    n+=1
  end
  return n

  # for i in ar
  #   return n if i>0
  #   n+=1
  # end
  -1
end

#Nomer_3.rb <Номер метода> <Путь к файлу с массивом>
methods = %i[min_elem positive_number]
method_n = ARGV[0].to_i
path = ARGV[1]
#puts('Введите номер метода:')
#method_n = gets.chomp
#puts('Введите название файла с массивом:')
#path = "C:/Users/Admin/LR_1/Zadacha_3/" + gets.chomp

file = File.open(path)
array = file.readline.split(' ').map(&:to_i)

puts "Массив, #{array}\n"
puts "Результат работы метода: #{method(methods[method_n]).call(array)}"
# case method_n
# when "0"
#   puts "Минимальный элемент = #{min_elem(array)}"
# when "1"
#   puts "Номер первого положительного элемента = #{positive_number(array)}"
# else
#   puts "такого метода нет"
# end


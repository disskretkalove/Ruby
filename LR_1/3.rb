# v1 Аналогично этому, можно использовать переданные аргументы и в наших программах.
# Аргументами считается всё, что пользователь напишет в консоли после названия вашей программы
# ruby program.rb агрумент1 аргумент2 аргумент3
# Аргументы разделяются пробелами и компилятор Ruby для удобства программистов уже аккуратно сам их
# складывает в массив ARGV, таким образом, если мы напишем программу hello.rb.
# puts "Hello, " + ARGV[0]
# И запустим её вот так
# ruby hello.rb World
#
system "color A"
require 'open3'
puts "Введите команду для выполнения её OS, например Time или Tree"
cmd = gets.chomp()
Open3.pipeline(cmd)
puts "Теперь введите некоторый код на Ruby для выполнения самой же Ruby"
rubyCmd = gets.chomp()
File.open("code.rb","w") do |file|
  file.write(rubyCmd)
end
cmd2 = "ruby code.rb"
Open3.pipeline(cmd2)

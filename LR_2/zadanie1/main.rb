require_relative 'zadacha_1.rb'
require_relative 'student_short'
#(last_name, first_name, paternal_name, id:nil, phone:nil, git:nil, telegram:nil, email:nil)
student = Student.new(last_name:'Левин', first_name:'Валентин', paternal_name:'Александрович', id:1)
student_2 = Student.new(last_name:'Гордов', first_name:'Султан', paternal_name:'Николаевич', id:2, git:'@sultan585', telegram:'@sultan585',email:'sultan585@gmail.com')
student_3 = Student.new(last_name:'Мазницкий',first_name:'Алексей',paternal_name:'Андреевич',phone:'8(918)-686-00-19', id:2, email:"alexa777m@gmail.com", git:'@almaz', telegram:'@almaz')

puts Student.valid_email?(student_3.email)

#puts student_3.id

# def read_from_txt(file_path)
#   if !File.exist?(file_path)
#     raise ArgumentError "This file '#{file_path}' not found"
#   else
#     student_list= Array.new
#     file = File.new(file_path, "r:UTF-8")
#     lines = file.read.to_s.strip
#     string_student=""
#     lines.each_char do |ch|
#       string_student+= ch
#       if ch=='}'
#         student_list.append(Student.pars_str(string_student))
#         string_student= ""
#       end
#     end
#     file.close
#   end
#   student_list
# end
#
#
# def write_to_txt(file_path, student_list)
#   if !File.exist?(file_path)
#     raise ArgumentError "This file '#{file_path}' not found"
#   else
#     result = ''
#     student_list.each do |student|
#       result +=student.to_json+ "\n"
#     end
#     File.write(file_path, result)
#   end
# end

# student_list= read_from_txt('students.txt')
#
# puts student_list
#
# write_to_txt('student_out.txt', student_list)
# puts student_list[0].getContact
# puts student_list[0].shortName
# puts st_test = StudentShort.new(student_list[0])

# puts "проверка парсинга строки"
# puts Student.pars_str('{"last_name":"Гончаренко", "first_name":"Валентина", "paternal_name":"Викторовна",
# "id":2, "git":"@yellowcat-dotcom", "telegram":"@yellowcatdotcom","email":"valentinagoncarenko975@gmail.com"}')
# puts


# puts "StudentShort"
# puts st_test = StudentShort.new(student_3)


# puts
# puts "StudennnnnnnnntShort from string"
# puts StudentShort.from_str(5, '{"last_name":"Гончаренко", "first_name":"Валентина", "paternal_name":"Викторовна",
# "id":2, "git":"@yellowcat-dotcom", "telegram":"@yellowcatdotcom","email":"valentinagoncarenko975@gmail.com"}')


#puts student_3.getContact


#puts student
#puts student_2
#puts student_3

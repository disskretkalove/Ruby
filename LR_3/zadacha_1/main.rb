require_relative '../../laba2/laba2.1/student'
require_relative 'student_short'
require_relative 'Super_Student'
require_relative 'Data_list'
require_relative 'data_table'
require_relative 'Data_List_Student_Short'
require 'mysql2'


str="name:Василий, surname:Васнецов, father_name:Анатольевич, id:11, git:@fdsa, tg:@qpfms"


@db_host  = "localhost"
@db_user  = "root"
@db_pass  = "йцукен123456789"
@db_name = "students"

client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)

results = client.query("SELECT * FROM student1", symbolize_keys: true)

results.each { |r|
  puts Student.new(**r)
  puts
}


# frozen_string_literal: true

require_relative 'student'
require_relative 'student_short'
require_relative 'Super_Student'
require_relative 'Data_list'
require_relative 'data_table'
require_relative 'Data_List_Student_Short'
require 'mysql2'
require 'fox16'
require_relative 'window'
require_relative 'student_list_controller'
require_relative 'main_window'

str = 'name:Василий, surname:Васнецов, father_name:Анатольевич, id:11, git:@fdsa, tg:@qpfms'

# @db_host  = "localhost"
# @db_user  = "root"
# @db_pass  = "йцукен123456789"
# @db_name = "students"

# client = Mysql2::Client.new(:host => @db_host, :username => @db_user, :password => @db_pass, :database => @db_name)

# results = client.query("SELECT * FROM student", symbolize_keys: true)

# results.each { |r|
# puts Student.new(**r)
# puts
# }

Student_List_View.new

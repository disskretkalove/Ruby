require_relative 'student_MyGem/version'

module Student_MyGem
  Dir[File.dirname(__FILE__) + '/files/**/*.rb'].each { |file|
    puts file
    require file
  }
end

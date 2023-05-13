require 'mysql2'
require_relative '../Student'
require_relative 'student_short'
require_relative 'data_list_student_short'
require_relative 'db_connection'

class StudentList_db_Adapter
  def initialize
    @db = DBConnection.instance
  end

  def add_student(student)
    stmt = @db.prepare('INSERT INTO student(surname, first_name, patronymic, phone, telegram, email, git) VALUES (?, ?, ?, ?, ?, ?, ?)')
    stmt.execute(*student_fields(student))

    @db.last_id
  end

  def remove_student(student_id)
    @db.query("DELETE FROM student WHERE id = #{student_id}")
  end

  def replace_student(student_id, student)
    stmt = @db.prepare('UPDATE student SET surname = ?, first_name = ?, patronymic = ?, phone = ?, telegram = ?, email = ?, git = ? WHERE id = ?')
    stmt.execute(*student_fields(student), student_id)
  end

  def student_by_id(student_id)
    result = @db.query("SELECT * FROM student WHERE id = #{student_id}").first
    return Student.from_hash(result.transform_keys(&:to_sym)) if result

    nil
  end

  def get_k_n_student_short_list(k, n)
    students = @db.prepare('SELECT * FROM student LIMIT ? OFFSET ?').execute((k - 1) * n, n)
    slice = students.map { |h| StudentShort.new(Student.from_hash(h)) }
    DataListStudentShort.new(slice)
  end

  def student_count
    @db.query('SELECT COUNT(id) FROM student').first.values.first
  end

  private


  def student_fields(student)
    [student.surname, student.first_name, student.patronymic, student.phone, student.telegram, student.email, student.git]
  end
end

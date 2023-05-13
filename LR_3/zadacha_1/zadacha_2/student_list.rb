class StudentList

  def initialize(data_adapter)
    @data_adapter = data_adapter
  end

  # Получение студента по id
  def student_by_id(student_id)
    @data_adapter.student_by_id(student_id)
  end

  # Добавление студента
  def add_student(student)
    @data_adapter.add_student(student)
  end

  # Удаление студента по id
  def remove_student(student_id)
    @data_adapter.remove_student(student_id)
  end

  # Замена студента по id
  def replace_student(student_id, student)
    @data_adapter.replace_student(student_id, student)
  end

  # Полуение количества студентов
  def student_count
    @data_adapter.student_count
  end

  # Полуение n элементов page страницы
  def get_k_n_student_short_list(k, n)
    @data_adapter.get_k_n_student_short_list(k, n)
  end
end

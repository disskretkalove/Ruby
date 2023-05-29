require 'minitest/autorun'
require_relative 'student.rb'
require 'json'

class StudentTest < Minitest::Test
  def setup
    @student = Student.new(
      name: 'Иванов',
      surname: 'Иван',
      father_name: 'Иванович',
      id: 10,
      phone: '+7-999-555-44-33',
      tg: '@ivanushka',
      mail: 'ivan@gmail.com',
      git: '@sbeugg505'
    )
  end

  def test_student_init_all_params_correct
    assert @student.Surname == 'Иванов'
    assert @student.Name == 'Иван'
    assert @student.Father_name == 'Иванович'
    assert @student.ID == 10
    assert @student.Phone == '7-999-555-44-33'
    assert @student.Tg == '@ivanushka'
    assert @student.Mail == '@ivan@gmail.com'
    assert @student.Git == '@sbeugg505'
  end

  def test_student_empty_options
    Student.new(name:'Иванов', surname:'Иван', father_name:'Иванович')
  end

  def test_student_contact
    short_contact = @student.contact
    assert short_contact[:type] == :tg
    assert short_contact[:value] == '@ivanushka'
  end


  def test_student_has_git
    assert @student.git? == true
  end

  def test_student_valid
    assert @student.valid? == true
  end

  def test_student_set_contacts
    stud = Student.new(name:'Иванов', surname:'Иван', father_name:'Иванович')
    stud.set_contacts(phone: '+7-999-888-77-66', tg: '@ivanchik', mail: 'ivan@gmail.com')

    assert stud.Phone == '+7-999-888-77-66'
    assert stud.Tg == '@ivanchik'
    assert stud.Mail == 'ivan@gmail.com'
  end

  def test_student_short_name
    assert @student.short_name == 'Иванов И. И.'
  end

end


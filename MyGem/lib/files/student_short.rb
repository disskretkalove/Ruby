require_relative 'Super_Student'
require_relative 'student'

class Student_short<Super_Student
  attr_reader :ID, :Surname, :Initials,:Git,:Contact
  def initialize(id:, surname:, initials:, git:, contact:)
    @ID = id
    @Surname = surname
    @Initials = initials
    @Git = git
    @Contact = contact
  end

  def self.from_student(student)
    Student_short.new(id:student.ID, surname:student.Surname, initials:"#{student.Name[0]}. #{student.Father_name[0]}.", git:student.Git, contact:student.contact)
  end

  def self.parse_str(str)
    Student_short.from_student(Student.parse_str(str))
  end

  def short_name
    "#{@Surname} #{@Initials}"
  end

  def to_s
    result = short_name
    result += ", id=#{@ID} " unless @ID.nil?
    result += ", git=#{@Git} " unless @Git.nil?
    result += @Contact unless @Contact.nil?
    result
  end

  def contact
    @Contact
  end

  def getInfo
    return self.short_name+@Git
  end

  def contact?
    !@Contact.nil?
  end
end
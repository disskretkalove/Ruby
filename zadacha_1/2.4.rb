class Student
  attr_accessor :id, :name, :lastName, :midleName, :phone, :tme, :mail, :git
  def initialize(lastName,name,midleName)
    self.id
    self.lastName = lastName
    self.name = name
    self.midleName = midleName
    self.phone
    self.telegram
    self.email
    self.git
  end
  def to_s
    "id: #{@id}, lastname: #{@lastName}, Name: #{@name}, midlename: #{@midleName}, phone: #{@phone}, @telegram #{@telegram}, email #{@email}, git: #{@git}\n"
  end
end

stud = Student.new("Левин","Валентин","Александрович")
print stud.to_s



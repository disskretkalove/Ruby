class Student
  attr_accessor :id, :name, :lastName, :midleName, :phone, :telegram, :email, :git
  #валидатор телефона
  def self.valid_phone?(phone)
    phone.match(/\A\+?\d{11}\z/)
  end
  def initialize(lastName: ,name: ,midleName:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)

    self.id =id
    self.lastName = lastName
    self.name = name
    self.midleName = midleName
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end

  def to_s
    "id: #{@id}, lastname: #{@lastName}, Name: #{@name}, midlename: #{@midleName}, phone: #{@phone}, @telegram #{@telegram}, email #{@email}, git: #{@git}\n"
  end

end

stud = Student.new(lastName: "Левин",name: "Валентин",midleName: "Александрович",phone: "+71234567890")
print stud.to_s


class Student
  attr_accessor :id, :name, :lastName, :midleName, :phone, :telegram, :email, :git
  #валидатор телефона
  def self.valid_phone?(phone)
    phone.match(/\A\+?\d{11}\z/)
  end
  #валидатор для фамилии имени и отчества
  def self.valid_name?(name)
    name.match(/^[А-Я][а-я]+$/)
  end

  #валидатор для git и telegram
  def self.valid_account?(account)
    account.match(/^@[A-Za-z0-9\-_]+$/)
  end

  #валидатор почты
  def self.valid_email?(email)
    email.match(/^[A-Za-z0-9\-_]+@[A-Za-z]+\.([A-Za-z]+\.)*[A-Za-z]+$/)
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
  def validate_git_exist
    if self.git then
      true
    else
      false
    end
  end
  def validate_contacts_exist
    if self.phone || self.telegram || self.email
      true
    else false end
  end

  def validate
    if validate_git_exist || validate_contacts_exist
      true
    else false end
  end
  def to_s
    "id: #{@id}, lastname: #{@lastName}, Name: #{@name}, midlename: #{@midleName}, phone: #{@phone}, @telegram #{@telegram}, email #{@email}, git: #{@git}\n"
  end
end

stud = Student.new(lastName: "Левин",name: "Валентин",midleName: "Александрович",phone: "+71234567890",email:"levinvalentin2079@gmail.com")
print stud.to_s




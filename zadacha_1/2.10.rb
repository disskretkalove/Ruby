class Student
  attr_reader :id, :name, :lastName, :midleName, :phone, :telegram, :email, :git
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
  def to_s
    "id: #{@id}, lastname: #{@lastName}, Name: #{@name}, midlename: #{@midleName}, phone: #{@phone}, @telegram #{@telegram}, email #{@email}, git: #{@git}\n"
  end

  def short_name
    "#{lastName}#{name[0]}#{midlename[0]}"
  end
  def set_contacts (phone: nil, telegram:nil,  email:nil)
    self.email = email if(email!=nil)
    self.telegram = telegram if(telegram!=nil)
    self.phone = phone if(phone!=nil)
  end
  def getInfo
    raise ArgumentError, "Empty fields" if lastName.nil? || name.nil? || midlename.nil?
    info="#{short_name}"
    git_info = "#git: #{git}" unless git.nil?
    contact_info = "#{find_contact}" unless find_contact.nil?

  end
  private
  attr_writer :id, :name, :lastName, :midleName, :git



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


  def phone= (phone)
    raise ArgumentError, "Задан неверный формат номера" if !phone.nil? and !Student.valid_phone?(phone)
    @phone = phone
  end

  def email=(email)

    raise ArgumentError, "Задана неверная почта" if !email.nil? and !Student.valid_email?(email)
    @email = email

  end

  def telegram=(telegram)
    raise ArgumentError, "Задан неверный аккаунт" if !telegram.nil? and !Student.valid_account?(telegram)
    @telegram = telegram
  end
end

stud = Student.new(lastName: "Левин",name: "Валентин",midleName: "Александрович",phone: "+71234ваолыо",email:"levinvalentin2079@gmail.com")
print stud.to_s
stud.set_contacts(phone: "+71234567890",telegram: "@levval",email: "levinvalentin2079@gmail.com")
print stud.to_s




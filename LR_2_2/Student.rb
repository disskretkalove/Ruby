require_relative 'Student_short.rb'

class Student < Person
  attr_reader :id, :name, :lastName, :midleName, :phone, :telegram, :email, :git

  def initialize(lastName:, name:, midleName:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)

    super(id, lastName, name, midleName)
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end

  def to_s
    result = super
    result += " phone=#{phone}" unless phone.nil?
    result += " git=#{git}" unless git.nil?
    result += " telegram=#{telegram}" unless telegram.nil?
    result += " email=#{email}" unless email.nil?
    result
  end

  def short_name
    "#{lastName} #{name[0]}. #{midlename[0]}."
  end

  def contact
    return "phone = #{phone}" unless phone.nil?
    return "telegram = #{telegram}" unless telegram.nil?
    return "email = #{email}" unless email.nil?
    return "git = #{git}" unless git.nil?
    nil
  end

  def set_contacts (phone: nil, telegram: nil, email: nil)
    self.email = email if (email != nil)
    self.telegram = telegram if (telegram != nil)
    self.phone = phone if (phone != nil)
  end

  def getInfo
    raise ArgumentError, "Empty fields" if lastName.nil? || name.nil? || midlename.nil?
    info = "#{short_name}"
    contact_info = "#{contact}" unless contact.nil?
    "#{info} #{contact_info}"

  end

  private

  attr_writer :id, :name, :lastName, :midleName, :git
end

class StudentShort < Person
  attr_reader :git, :contact

  def initialize(id, name_string, git: nil, contact: nil)
    last_name, name, midle_name = name_string.split(" ")
    super(id, last_name, name, midle_name)
    @git = git
    @contact = contact
  end

  def to_s
    result = super
    result += " git=#{git}" unless git.nil?
    result += " contact=#{contact}" unless contact.nil?
    result
  end

  def getInfo
    "#{short_name}, #{contact}"
  end
end








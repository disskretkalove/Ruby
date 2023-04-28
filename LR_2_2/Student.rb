require_relative 'Student_short.rb'
require 'json'
require_relative 'Person.rb'
class Student < Person
  attr_reader :id, :name, :lastName, :midleName, :phone, :telegram, :email, :git

  def initialize(lastName:, name:, midleName:, id: nil, phone: nil, telegram: nil, email: nil, git: nil)

    super(id, lastName, name, midleName)
    self.phone = phone
    self.telegram = telegram
    self.email = email
    self.git = git
  end

  def self.pars_str(str)
    args = JSON.parse(str)
    raise ArgumentError,"The argument must have last_name, first_name and paternal_name" unless
      (args.has_key?('last_name') and args.has_key?('first_name') and args.has_key?('paternal_name'))

    new(lastName: args['last_name'],
        name: args['first_name'],
        midleName: args['paternal_name'],
        id: args['id'],
        phone: args['phone'],
        git: args['git'],
        telegram: args['telegram'],
        email: args['email'])
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










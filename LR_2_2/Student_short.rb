require 'json'
class StudentShort
  attr_reader :git, :contact


  def initialize(id:, initials: ,git: ,contact: )
    self.id = id
    self.initials = "#{student.last_name} #{student.name[0]}.#{student.midle_name[0]}. "
    self.git = student.git unless student.git.nil?
    self.contact = student.set_contacts(phone: student.phone, email: student.email, telegram: student.telegram)
  end

  def self.from_str(id, str)
    result = JSON.parse(str)
    raise ArgumentError, 'Missing fields: last_name, name, midle_name' unless result.key?('name') &&
      result.key?('last_name') && result.key?('midle_name')

    StudentShort.new(id:result[id],initials: result[initials],git: result[git],contact: result[contact])
  end

  def self.from_student(student)
    StudentShort.new(id: student.id,initials: "#{student.lastName} #{student.name[0]}.#{student.midleName[0]} ",git: student.git,contact: student.contact)
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


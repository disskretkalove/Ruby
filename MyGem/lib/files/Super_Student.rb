class Super_Student

  attr_accessor :Name, :Surname, :Father_name, :ID, :Git

  def initialize(name, surname, father_name, id, git)
    self.Name = name
    self.Surname = surname
    self.Father_name = father_name
    self.ID = id
    self.Git = git
  end

  def self.id_valid?(id)
    String(id).match(/^\d+$/)
  end

  def ID=(id)
    @ID = id
  end

  def self.name_valid?(name)
    name.match(/^[А-Я][^А-Я\d]+$/)
  end

  def Name=(name)
    raise ArgumentError("Invalid value, Name is russian alphabet sequence") unless Super_Student.name_valid?(name)
    @Name = name
  end

  def Surname=(surname)
    raise ArgumentError("Invalid value, Surname is russian alphabet sequence") if !surname.nil? && !Super_Student.name_valid?(surname)
    @Surname = surname
  end

  def Father_name=(father_name)
    raise ArgumentError("Invalid value, Father name is russian alphabet sequence") if !father_name.nil? && !Super_Student.name_valid?(father_name)
    @Father_name = father_name
  end

  def self.acc_valid?(account)
    account.match(/^@[\w\d\-_]+$/)
  end

  def Git=(git)
    raise ArgumentError, "Invalid value, Git's correct form is @X where X is english alphabet sequence" if !git.nil? && !Student.acc_valid?(git)
    @Git = git
  end

  def short_name
    "#{Surname} #{Name.upcase[0]}. #{Father_name.upcase[0]}"
  end

  def self.parse_str(str)
  end

  def getInfo
  end

  def contact
  end

  def to_s
  end

end
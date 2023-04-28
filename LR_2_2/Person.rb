class Person
  attr_reader :id, :last_name, :name, :midle_name

  def initialize(id, last_name, name, midle_name)
    @id = id
    @last_name = last_name
    @name = name
    @midle_name = midle_name
  end

  def short_name
    "#{last_name} #{name[0]}. #{midle_name[0]}."
  end

  def to_s
    "#{id}, #{last_name} #{name} #{midle_name}"
  end
end

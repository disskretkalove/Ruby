require_relative 'Data_list'
require_relative 'Data_table'
class DataListStudentShort < DataList
  public_class_method :new

  def get_names
    ["Short_names", "git", "contact"]
  end

  def get_data
    result = []
    id = 0
    objs_list.each do |obj|
      str = []
      str << id
      # * необходима так как, если нам передадут [1,2,3], то передастся str.push(1,2,3)
      str.push(*table_fields(obj))
      result << str
      id += 1
    end
    DataTable.new(result)
  end

  protected
  # применение паттерна Шаблон
  # сеттер для массива объектов
  def table_fields(object)
    [object.Short_names, object.git, object.contact]
  end
end

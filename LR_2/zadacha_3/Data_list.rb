class DataList

  private_class_method :new
  #Реализовать сеттер для массива объектов
  attr_writer :objs_list

  def initialize(objects)
    self.objs_list = objects
    self.selected_objs = []
  end

  def select(number)
    selected_objs.append(number)
  end

  # def clear_select
  #   self.selected_objs = []
  # end

  def get_selected
    return [] if selected_objs.empty?

    selected_id_list = []
    selected_objs.each do |num|
      selected_id_list.append(objs_list[num].id)
    end
    selected_id_list
  end

  def get_names
    raise NotImplementedError, "Данный метод необходимо реализовать в классе наследнике"
  end
  # применение паттерна
  def get_data
    raise NotImplementedError, "Данный метод необходимо реализовать в классе наследнике"
  end

  #данный метод необходимо переопределять у наследников
  def table_fields(object)
    []
  end



  private
  attr_reader :objs_list
  attr_accessor :selected_objs
end

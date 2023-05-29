require_relative "window.rb"
require_relative 'Basic_list'
require_relative 'Student_list_DB'

class StudentListController
  private
  attr_accessor :view, :list, :data_list_student_short

  public
  def initialize(view)
    self.view = view
    self.list = Basic_list.new
    self.list.format = Student_list_DB.new
    self.load_list
    self.data_list_student_short = self.list.get_k_n_student_short_list(k:0, n:self.table_row_count)
    self.data_list_student_short.view = self.view
  end

  def cur_page
    if @cur_page.nil? or @cur_page <= 1 or @cur_page > self.page_count then @cur_page = 1 end

    @cur_page
  end

  def del_selected
    id_array = self.data_list_student_short.get_selected
    id_array.each do |id|
      self.list.delete_byID(id: id)
    end
  end

  def unselect
    self.data_list_student_short.unselect
  end

  def select(id)
    self.data_list_student_short.select(id)
  end

  def page_count
    if !self.list.nil? then
      (self.list.get_student_short_count.to_f / self.table_row_count).ceil
    else
      1
    end
  end

  def next_page
    self.cur_page += 1
  end

  def prev_page
    self.cur_page -= 1
  end

  def refresh_data(reload: false)
    if (reload) then
      self.load_list()
    end

    self.list.get_k_n_student_short_list(k:self.cur_page - 1, n:self.table_row_count, data_list: data_list_student_short)

    self.data_list_student_short.notify
  end

  def sort
    self.list.sort_si
  end


  private

  def table_row_count; 10 end

  def last_page?(page)
    page >= self.page_count
  end

  def first_page?(page)
    page <= 1
  end

  def cur_page=(value)
    if last_page?(value) then
      @cur_page = self.page_count
    elsif first_page?(value) then
      @cur_page = 1
    else
      @cur_page = value
    end
  end

  def load_list
    self.list.read_list
  end

end

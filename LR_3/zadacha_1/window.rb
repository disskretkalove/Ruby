
require 'fox16'
include Fox

class Window < FXMainWindow
  private
  attr_accessor :add_button, :chg_button, :del_button, :upd_button, :refresh, :page_count_label
  attr_writer :cur_page

  public
  attr_reader :cur_page
  attr_accessor :table, :page_count

  def page_count= value
    @page_count = value
    self.page_count_label.text = value.to_s
  end

  def self.table_row_count; 10 end

  def handle_list_box_command index, listbox, field
    item_text = listbox.getItemText(index)
    if(item_text == "Да")
      field.enable
    else
      field.disable
    end
  end

  def add_name_field frame
    name_label = FXLabel.new(frame, "Фамилия и инициалы: ")
    name_field = FXTextField.new(frame, 10)
  end

  def add_git_field frame
    git_label = FXLabel.new(frame, "Наличие гита: ")
    git_list = FXListBox.new(frame, width: 15, opts: COMBOBOX_STATIC | COMBOBOX_NO_REPLACE)
    git_list.appendItem("Да")
    git_list.appendItem("Нет")
    git_list.appendItem("Не важно")

    git_field_label = FXLabel.new(frame, "Гит: ")
    git_field = FXTextField.new(frame, 10)

    git_list.connect(SEL_COMMAND) do |sender, selector, index|
      handle_list_box_command index, git_list, git_field
    end
  end

  def add_email_field frame
    email_label = FXLabel.new(frame, "Наличие мейла: ")
    email_list = FXListBox.new(frame, width: 15, opts: COMBOBOX_STATIC | COMBOBOX_NO_REPLACE)
    email_list.appendItem("Да")
    email_list.appendItem("Нет")
    email_list.appendItem("Не важно")

    email_field_label = FXLabel.new(frame, "Мейл: ")
    email_field = FXTextField.new(frame, 30)

    email_list.connect(SEL_COMMAND) do |sender, selector, index|
      handle_list_box_command index, email_list, email_field
    end
  end

  def add_phone_field frame
    phone_label = FXLabel.new(frame, "Наличие телефона: ")
    phone_list = FXListBox.new(frame, width: 15, opts: COMBOBOX_STATIC | COMBOBOX_NO_REPLACE)
    phone_list.appendItem("Да")
    phone_list.appendItem("Нет")
    phone_list.appendItem("Не важно")

    phone_field_label = FXLabel.new(frame, "Телефон: ")
    phone_field = FXTextField.new(frame, 17)

    phone_list.connect(SEL_COMMAND) do |sender, selector, index|
      handle_list_box_command index, phone_list, phone_field
    end
  end

  def add_tg_field frame
    tg_label = FXLabel.new(frame, "Наличие телеграма: ")
    tg_list = FXListBox.new(frame, width: 10, opts: COMBOBOX_STATIC | COMBOBOX_NO_REPLACE)
    tg_list.appendItem("Да")
    tg_list.appendItem("Нет")
    tg_list.appendItem("Не важно")

    tg_field_label = FXLabel.new(frame, "Телеграм: ")
    tg_field = FXTextField.new(frame, 10)

    tg_list.connect(SEL_COMMAND) do |sender, selector, index|
      handle_list_box_command index, tg_list, tg_field
    end
  end

  def add_table frame
    self.table = FXTable.new(frame, :opts => LAYOUT_FILL)
    self.table.setTableSize(self.class.table_row_count, 4)



    self.table.editable = false

    self.table.connect(SEL_SELECTED) do
      all_cols_selected = self.table.selEndColumn - self.table.selStartColumn + 1 == self.table.numColumns
      num_selected_rows = self.table.selEndRow - self.table.selStartRow + 1

      if num_selected_rows == 1 and all_cols_selected
        self.chg_button.enable
        self.del_button.enable
      elsif num_selected_rows > 1 and all_cols_selected
        self.chg_button.disable
        self.del_button.enable
      else
        self.chg_button.disable
        self.del_button.disable
      end
    end

    def sort_table_by_column(table, column_index)
      #ере
      table_data = (0...table.getNumRows()).map { |row_index| (0...table.getNumColumns()).map { |col_index| table.getItemText(row_index, col_index) } }

      sorted_table_data = table_data.sort_by { |row_data| row_data[column_index] }
      sorted_table_data.each_with_index do |row_data, row_index|
        row_data.each_with_index do |cell_data, col_index|
          table.setItemText(row_index, col_index, cell_data)
        end
      end
    end

    self.table.columnHeader.connect(SEL_COMMAND) do |_, _, index|
      if(index == 0)
        sort_table_by_column(self.table, index)
      else
        puts "Сортировочки нет и не будет"
      end
    end
  end

  def add_crud_buttons frame
    self.add_button = FXButton.new(frame, "Добавить")
    self.chg_button = FXButton.new(frame, "Изменить")
    self.del_button = FXButton.new(frame, "Удалить")
    self.upd_button = FXButton.new(frame, "Обновить")

    self.chg_button.disable
    self.del_button.disable
  end

  def add_lcr_buttons frame
    left_button = FXButton.new(frame, "<<")
    cur_label = FXLabel.new(frame, self.cur_page.to_s)
    FXLabel.new(frame, "/")
    self.page_count_label = FXLabel.new(frame, self.page_count.to_s)
    right_button = FXButton.new(frame, ">>")

    left_button.connect(SEL_COMMAND) do
      if(self.cur_page > 1)
        self.cur_page -= 1
        cur_label.text = self.cur_page.to_s
        self.refresh.call
      end
    end

    right_button.connect(SEL_COMMAND) do
      if(self.cur_page < self.page_count)
        self.cur_page += 1
        cur_label.text = self.cur_page.to_s
        self.refresh.call
      end
    end
  end

  def set_table_headers arr
    self.table.setColumnText(0, "№")

    arr.each_with_index { |value, index|
      self.table.setColumnText(index+1, value)
    }
  end

  def add_row_hardcode

    table.setTableSize(16, 3)
    table.setColumnWidth(0, 250)
    table.setColumnWidth(1, 250)
    table.setColumnWidth(2, 300)
    table.setItemText(0, 0, "Иванов И.И.")
    table.setItemText(0, 1, "@ivan")
    table.setItemText(0, 2, "ivan@gmail.com")
    table.setItemText(1, 0, "Иванова М.И.")
    table.setItemText(1, 1, "@maria")
    table.setItemText(1, 2, "maria@gmail.com")

  end

  def initialize(app)
    super(app, "StudentListView" , :width => 1300, :height => 600)

    self.cur_page = 1

    hFrame1 = FXHorizontalFrame.new(self)
    self.add_name_field hFrame1

    self.add_git_field hFrame1

    hFrame2 = FXHorizontalFrame.new(self)
    self.add_email_field hFrame2

    hFrame3 = FXHorizontalFrame.new(self)
    self.add_phone_field hFrame3

    hFrame4 = FXHorizontalFrame.new(self)
    self.add_tg_field hFrame4

    hFrame5 = FXHorizontalFrame.new(self)
    FXLabel.new(hFrame5, "Таблица")

    hFrame6 = FXHorizontalFrame.new(self, opts: LAYOUT_FILL_X | LAYOUT_FIX_HEIGHT)
    hFrame6.height = 300

    self.add_table hFrame6

    hFrame7 = FXHorizontalFrame.new(self, opts: LAYOUT_FILL_X)
    add_lcr_buttons hFrame7


    hFrame8 = FXHorizontalFrame.new(self, opts: LAYOUT_FILL_X)
    add_crud_buttons hFrame8

    add_row_hardcode
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end
end

app = FXApp.new
Window.new(app)
app.create
app.run

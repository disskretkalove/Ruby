class Data_table

  private
  attr_writer :table
  public
  attr_reader :table
  def initialize(table:)
    self.table = table
  end
  def get_element(row:, col:)
    return self.table[row][col]
  end
  def get_rows_number
    return self.table.size
  end

  def each(&block)
    table.each do |row|
      block.call(row)
    end
  end

  def get_cols_number
    return 0 if table.size == 0
    return self.table[0].size
  end
end
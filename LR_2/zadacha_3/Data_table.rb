class DataTable
  attr_reader :str_count, :col_count

  def initialize(table)

    self.str_count = table.length
    max_col = 0
    table.each do |str|
      max_col = str.length if str.size > max_col
    end
    self.col_count = max_col
    self.table = table
  end

  #получить элемент по номеру
  def get_element(str, col)
    return nil if str >= str_count || str<0
    return nil if col >= col_count || col<0

    table[str][col]
  end

  def to_s
    table.map { |str| "[#{str.join(', ')}]" }.join("\n")
  end

  private

  attr_accessor :table
  attr_writer :str_count, :col_count

end

 table = DataTable.new([
                         [7, 2, 0],
                         [5, 1, 4],
                         [9, 5, 5]
                       ])

# puts table.get_element(2, 1)
# puts table.to_s
# puts table.cols_count
# puts table.rows_count

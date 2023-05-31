require_relative 'Basic_format'
class Student_list_DB < Basic_format

  require 'mysql2'
  require_relative 'DB_singleton'
  require 'json'

  private
  def format_to_hash(str: )
    return  JSON.parse(str, {:symbolize_names => true})
  end

  def hash_to_format(hash: )
    values = hash.map { |h|
      h.values.join ","
    }.map { |str|
      "(#{str})"
    }.join(",")
    return values
  end

  def read_file(rfile:)
    results = client.query("SELECT * FROM student", symbolize_keys: true).to_a
    return JSON.pretty_generate(results)
  end

  def write_file(wfile:, data:)
    insert_query = "insert into student values #{data}"
    self.client.query insert_query
  end

  public
  attr_accessor :client
  def initialize
    self.client = Mysql2::Client.new(
      host: 'localhost',
      username: 'root',
      password: 'йцукен123456789',
      database: 'students'
    )
  end

end
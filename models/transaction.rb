require('pg')
require_relative('./tag')
require_relative('../db/sql_runner')

class Transaction

  def initialize(options)
    @id = options['id'].to_i
    @merchant = options['merchant']
    @value = options('value').to_i
    @date_of_trans = options('date_of_trans')
    @tag_id = options('tag_id').to_i
  end

  def save
    sql = "INSERT INTO transactions (merchant, value, date_of_trans, tag_id) VALUES ('#{@merchant}', #{@value}, '#{@date_of_trans}', #{@tag_id});"
    transaction = SqlRunner.run(sql)[0]
    @id = transaction['id'].to_i
  end

end
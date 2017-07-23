require('pg')
require_relative('./tag')
require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :tag_id
  attr_accessor :merchant, :value, :date_of_trans

  def initialize(options)
    @merchant = options['merchant']
    @value = options['value'].to_i
    @date_of_trans = options['date_of_trans']
    @tag_id = options['tag_id'].to_i
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO transactions (merchant, value, date_of_trans, tag_id) VALUES ('#{@merchant}', '#{@value}', '#{@date_of_trans}', '#{@tag_id}') RETURNING id;"
    transaction = SqlRunner.run(sql)[0]
    @id = transaction['id'].to_i
  end

  def self.total_of_all_transactions
    all_results = Transaction.find_all
    total = 0
    all_results.each { |transaction| total +=transaction.value}
    return total
  end

  def self.find_all
    sql = "SELECT * FROM transactions;"
    transactions = SqlRunner.run(sql)
    result = transactions.map { 
      |transaction| Transaction.new(transaction) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM transactions;"
    SqlRunner.run(sql)
  end
 

  def self.find_by_tag(tag_id)
    sql = "SELECT transactions.* FROM transactions
      INNER JOIN tags ON tags.id = transactions.tag_id
      WHERE transactions.tag_id = #{tag_id};"
     transactions = SqlRunner.run(sql)
     result = transactions.map { |transaction| Transaction.new(transaction) } 
     return result
     return transactions
  end

end
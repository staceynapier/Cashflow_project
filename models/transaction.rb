require('pg')
require('pry')
require_relative('./tag')
require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :tag_id, :type
  attr_accessor :merchant, :value, :date_of_trans, :description

  def initialize(options)
    @merchant = options['merchant'].capitalize
    @description = options['description']
    @value = options['value'].to_f
    @date_of_trans = options['date_of_trans']
    @tag_id = options['tag_id'].to_i
    @type = options['type']
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO transactions (merchant, description, value, date_of_trans, tag_id)
       VALUES ('#{@merchant}', '#{@description}', #{@value}, '#{@date_of_trans}', #{@tag_id}) RETURNING id;"
        transaction = SqlRunner.run(sql)[0]
    @id = transaction['id'].to_i
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = #{id}"
    result = SqlRunner.run(sql).first
    return Transaction.new(result)
  end

  def self.total_of_all_transactions
    all_results = Transaction.find_all
    total = 0
    all_results.each { |transaction| total +=transaction.value}
    return total
  end

  def self.find_all
    sql = "SELECT transactions.*, tags.type FROM transactions, tags
          WHERE transactions.tag_id = tags.id
          ORDER BY date_of_trans DESC;"
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
    sql = "SELECT transactions.*, tags.type as type FROM transactions
      INNER JOIN tags ON tags.id = transactions.tag_id
      WHERE transactions.tag_id = #{tag_id};"
     transactions = SqlRunner.run(sql)
     result = transactions.map { |transaction| Transaction.new(transaction) } 
     return result
  end

  def self.total_by_tag(tag_id)
    sql = "SELECT SUM (value) FROM transactions WHERE tag_id = #{tag_id};"
      transactions = SqlRunner.run(sql)
      amount = transactions.first['sum']
      return amount
  end

end
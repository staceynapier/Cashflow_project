require('pg')
require_relative('../db/sql_runner')

class Wallet

  attr_accessor :budget

  def initialize(options)
    @budget = options['budget'].to_f
  end

  def save
    sql = "INSERT INTO wallet (budget) VALUES ('#{@budget}')"
    amount = SqlRunner.run(sql)
  end

end
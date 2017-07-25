require('pg')
require_relative('../db/sql_runner')

class Wallet

  attr_accessor :budget
  attr_reader :id

  def initialize(options)
    @budget = options['budget'].to_f
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO wallets (budget) VALUES ('#{@budget}')"
    amount = SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM wallets WHERE id = #{id}"
    wallet_hash = SqlRunner.run(sql).first
    result = Wallet.new(wallet_hash)
    return result
  end

  def update
    sql = "UPDATE wallets SET (budget) = (#{@budget})"
    result = SqlRunner.run(sql)
  end

end
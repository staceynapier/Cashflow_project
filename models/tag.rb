require('pg')
require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :type, :icon

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
    @icon = options['icon']
  end

  def save
    sql = "INSERT INTO tags (type, icon) VALUES ('#{@type}', '#{@icon}') RETURNING id;"
    tag = SqlRunner.run(sql)[0]
    @id = tag['id'].to_i
  end

  def self.find_all
    sql = "SELECT * FROM tags";
    tags = SqlRunner.run(sql)
    results = tags.map { |tag| Tag.new(tag) }
    return results
  end

  def self.delete_all
    sql = "DELETE FROM tags;"
    SqlRunner.run(sql)
  end

end
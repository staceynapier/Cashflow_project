require('pg')
require_relative('../db/sql_runner')

class tag

  def initialize(options)
    @id = options['id'].to_i
    @type = options['type']
    @icon = options['icon']
  end

  def save
    sql = "INSERT INTO tags (type, icon) VALUES (#{@type}, #{@icon}) RETURNING id;"
    tag = SqlRunner.run(sql)[0]
    @id = tag['id']
  end

end
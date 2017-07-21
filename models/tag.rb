require('pg')
require_relative('../db/sql_runner')

class tag

  def initialize(options)
    @id = options['id']
    @logo = options['logo']
  end

  def save
    sql = 
  end

end
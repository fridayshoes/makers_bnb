require 'pg'

class Rental
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_database_test')
    else  
      connection = PG.connect(dbname: 'makersbnb_database')
    end

    result = connection.exec("SELECT * FROM spaces_table;")
    result.map { |space| space['space_name'] }
  end

  def self.create(space_name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_database_test')
    else  
      connection = PG.connect(dbname: 'makersbnb_database')
    end

    connection.exec("INSERT INTO spaces_table (space_name) VALUES('#{space_name}')")
  end
end




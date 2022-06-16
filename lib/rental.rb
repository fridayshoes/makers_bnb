require 'pg'

class Rental
  attr_reader  :space_name, :description, :price_per_night

  def initialize(space_name:, description:, price_per_night:)
    @space_name = space_name
    @description = description
    @price_per_night = price_per_night
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_database_test')
    else  
      connection = PG.connect(dbname: 'makersbnb_database')
    end

    result = connection.exec("SELECT * FROM spaces_table;")
    result.map do |space| 
      Rental.new(space_name: space["space_name"], description: space["description"], price_per_night: space["price_per_night"])
    end
  end

  def self.create(space_name:, description:, price_per_night:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_database_test')
    else  
      connection = PG.connect(dbname: 'makersbnb_database')
    end

    
    result = connection.exec_params("INSERT INTO spaces_table (space_name, description, price_per_night) VALUES($1, $2, $3)RETURNING space_name, description, price_per_night;", [space_name, description, price_per_night])
    Rental.new(space_name: result[0]["space_name"], description: result[0]["description"], price_per_night: result[0]["price_per_night"])
  end
end




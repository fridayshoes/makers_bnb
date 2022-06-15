require 'pg'

class Booking
  def initialize(space_name:)
    @space_name = space_name
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "makersbnb_database_test")  
    else
      connection = PG.connect(dbname: "makersbnb_database")
    end
    result = connection.exec("")
  end


end
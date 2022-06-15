require 'rental'

describe Rental do
  describe '.all' do
    it 'returns all spaces' do
      connection = PG.connect(dbname: 'makersbnb_database_test')

    connection.exec("INSERT INTO spaces_table (space_name) VALUES ('nice, sunny room');")  
    connection.exec("INSERT INTO spaces_table (space_name) VALUES ('spacious room in London');")
    connection.exec("INSERT INTO spaces_table (space_name) VALUES ('country cottage in Yorkshire');")
    
    spaces = Rental.all

    expect(spaces).to include("nice, sunny room")
    expect(spaces).to include("spacious room in London")
    expect(spaces).to include("country cottage in Yorkshire")
    end
  end

  describe'.create' do
    it 'creates a new space' do
      Rental.create(space_name: 'fabulous seaviews')

      expect(Rental.all).to include 'fabulous seaviews'
    end
  end
end  
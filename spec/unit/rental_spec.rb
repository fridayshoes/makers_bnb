require 'rental'

describe Rental do
  describe '.all' do
    it 'returns all spaces' do
      connection = PG.connect(dbname: 'makersbnb_database_test')
      
      # connection.exec("INSERT INTO accounts_table (first_name, last_name, email, username, password) VALUES ('Alice', 'Saunders', 'ali1@example.com', 'A1', 'asdfbhs782');")
      # connection.exec("INSERT INTO spaces_table (space_name, description, price_per_night) VALUES ('Fred Farm', 'nice, sunny room', 70.00);")
      
      connection.exec("INSERT INTO spaces_table(space_name, description, price_per_night) VALUES ('Fred Farm', 'nice weather', 70.00);")
  
    
      spaces = Rental.all

      expect(spaces.first.space_name).to eq "Fred Farm"
      expect(spaces.first.description).to eq "nice weather"
      expect(spaces.first.price_per_night).to eq "70.00"
    end
  end

  describe'.create' do
    it 'creates a new space' do
      Rental.create(space_name: 'Fred Farm', description: 'nice weather',price_per_night: 70.00)
     
      spaces = Rental.all

      expect(spaces.first.space_name).to eq "Fred Farm"
      expect(spaces.first.description).to eq "nice weather"
      expect(spaces.first.price_per_night).to eq "70.00"
    end
  end
end  
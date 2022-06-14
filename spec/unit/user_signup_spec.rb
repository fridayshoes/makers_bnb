require 'rental.rb'

describe Rental do
  describe ".all" do
    it "returns all users" do
      connection = PG.connect(dbname: "makersbnb_database_test")
      # Add the test data
      connection.exec("INSERT INTO accounts_table (first_name, last_name, email, username, password) VALUES ('Alice', 'Saunders', 'ali1@example.com', 'A1', 'asdfbhs782');")
      rental = Rental.all

      # expect(rental.first.account_id).to eq 1        
      expect(rental.first.first_name).to eq "Alice"
      expect(rental.first.last_name).to eq "Saunders"
      expect(rental.first.email).to eq "ali1@example.com"
      expect(rental.first.username).to eq "A1"
      expect(rental.first.password).to eq "asdfbhs782"
    end
  end
end
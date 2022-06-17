require 'account'

describe Accounts do
  describe ".all" do
    it "returns multiply of users" do
      connection = PG.connect(dbname: "makersbnb_database_test")
      # Add the test data
      
      connection.exec("INSERT INTO accounts_table (first_name, last_name, email, username, password) VALUES ('Mike', 'Saunders', 'ali1@example.com', 'A1', 'asdfbhs782');")
      connection.exec("INSERT INTO accounts_table (first_name, last_name, email, username, password) VALUES ('Jo' , 'Samuels', 'jo@samuels.com', 'B1', '12345');")
      
      account = Accounts.all
      

      # expect(account.first.account_id).to eq 1        
      expect(account.first.first_name).to eq "Mike"
      expect(account.first.last_name).to eq "Saunders"
      expect(account.first.email).to eq "ali1@example.com"
      expect(account.first.username).to eq "A1"
      expect(account.first.password).to eq "asdfbhs782"

      expect(account.last.first_name).to eq "Jo"
      expect(account.last.last_name).to eq "Samuels"
      expect(account.last.email).to eq "jo@samuels.com"
      expect(account.last.username).to eq "B1"
      expect(account.last.password).to eq "12345"
    end
  end
end
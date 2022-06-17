require 'pg'

p "Setting up test database..."
def setup_test_database
  connection = PG.connect(dbname: 'makersbnb_database_test')
  connection.exec("TRUNCATE TABLE spaces_table, accounts_table, bookings_table;")
end
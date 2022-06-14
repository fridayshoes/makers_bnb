require "pg"

class Rental
  attr_reader :first_name, :last_name, :email, :username, :password

  def initialize(first_name:, last_name:, email:, username:, password:)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @username = username
    @password = password
  end

  def self.all
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "makersbnb_database_test")
    else
      connection = PG.connect(dbname: "makersbnb_database")
    end
  
    result = connection.exec("SELECT * FROM accounts_table;")
    result.map do |account|
      Rental.new(first_name: account["first_name"], last_name: account["last_name"], email: account["email"], username: account["username"], password: account["password"])
    end
  end

  def self.create(first_name:, last_name:, email:, username:, password:)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "makersbnb_database_test")
    else
      connection = PG.connect(dbname: "makersbnb_database")
    end

    result = connection.exec_params("INSERT INTO accounts_table (first_name, last_name, email, username, password) VALUES($1, $2) RETURNING first_name, last_name, email, username, password;", [first_name, last_name, email, username, password])
    Rental.new(first_name: result[0]["first_name"], last_name: result[0]["last_name"], email: result[0]["email"], username: result[0]["username"], password: result[0]["password"])
  end
end
feature "view all spaces" do
  scenario "a user views a list of all spaces" do
    connection = PG.connect(dbname: 'makersbnb_database_test')
    Rental.create(space_name: 'Fred Farm', description: 'nice weather',price_per_night: 70.00)
    # connection.exec("INSERT INTO spaces_table (space_name) VALUES ('nice, sunny room');")  
    # connection.exec("INSERT INTO spaces_table (space_name) VALUES ('spacious room in London');")
    # connection.exec("INSERT INTO spaces_table (space_name) VALUES ('country cottage in Yorkshire');")

    visit('/spaces')
    
    expect(page).to have_content("nice weather")
    # expect(page).to have_content("spacious room in London")
    # expect(page).to have_content("country cottage in Yorkshire")
  end
end




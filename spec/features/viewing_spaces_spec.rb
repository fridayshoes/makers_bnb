feature "view all spaces" do
  scenario "a user views a list of all spaces" do
    visit('/spaces')
    expect(page).to have_content("nice, sunny room")
    expect(page).to have_content("spacious room in London")
    expect(page).to have_content("country cottage in Yorkshire")
  end
end
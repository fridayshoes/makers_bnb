require 'booking.rb'

feature "booking of a space requested" do
  scenario "by a user" do
    visit('/spaces')
    click_button('Request to book')
    #sleep(2)
  expect(page).to have_content "Awaiting confirmation"
  end
end
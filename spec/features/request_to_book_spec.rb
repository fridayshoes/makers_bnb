require "booking.rb"

feature "booking of a space requested" do
  scenario "by a user" do
    Rental.create(space_name: "Sams sunny villa")
    visit("/spaces")
    expect(page).to have_content "Sams sunny villa"
    first(".rental").click_button "Request to book"
    #sleep(2)
    expect(current_path).to eq "/booking_status"
    expect(page).to have_content "Awaiting confirmation"
  end
end


# How to use string interpolation for a redirect - "expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

require "booking.rb"

describe Booking do
  xit "Checks space having been requested is changed from FALSE to TRUE" do
    user_booking = Booking(space_name).new
    expect(user_booking.book.first.requested).to eq TRUE
  end
end
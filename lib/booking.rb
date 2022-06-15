require 'pg'

class Booking
  def initialize(space_name:)
    @space_name = space_name
  end

  def self.book
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "makersbnb_database_test")
    else
      connection = PG.connect(dbname: "makersbnb_database")
    end

    result = connection.exec_params("INSERT INTO bookings_table (booking_id, space_id, account_id, booked_from_date, booked_to_date, requested, approved) VALUES($1, $2) RETURNING booking_id, space_id, account_id, booked_from_date, requested, approved;", [booking_id, space_id, account_id, booked_from_date, requested, approved])
    Booking.new(booking_id: result[0]["booking_id"], space_id: result[0]["space_id"], account_id: result[0]["account_id"], booked_from_date: result[0]["booked_from_date"], booked_to_date: result[0]["booked_to_date"], requested: result[0]["requested", approved: result[0]["approved"]] )
  end

end
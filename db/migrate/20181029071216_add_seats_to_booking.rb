class AddSeatsToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :seats, :integer
  end
end

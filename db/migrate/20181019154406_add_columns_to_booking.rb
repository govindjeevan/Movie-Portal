class AddColumnsToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :movie_name, :string
    add_column :bookings, :theatre_name, :string
    add_column :bookings, :start_time, :datetime
  end
end

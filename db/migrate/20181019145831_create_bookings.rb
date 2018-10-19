class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :movie_id
      t.integer :theatre_id
      t.integer :user_id
      t.integer :show_id
      t.integer :seats

      t.timestamps
    end
  end
end

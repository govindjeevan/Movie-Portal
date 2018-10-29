class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.integer :show_id
      t.integer :booking_id
      t.integer :seat_id

      t.timestamps
    end
  end
end

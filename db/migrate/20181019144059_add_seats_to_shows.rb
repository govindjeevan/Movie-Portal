class AddSeatsToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :seats, :integer
  end
end

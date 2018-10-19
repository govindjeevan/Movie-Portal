class AddTheatreIdToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :theatre_id, :integer
  end
end

class RemoveSeatsFromShows < ActiveRecord::Migration[5.2]
  def change
    remove_column :shows, :seats, :integer
  end
end

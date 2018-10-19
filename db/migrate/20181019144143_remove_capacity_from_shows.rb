class RemoveCapacityFromShows < ActiveRecord::Migration[5.2]
  def change
    remove_column :shows, :capacity, :integer
  end
end

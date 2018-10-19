class AddCapacityToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :capacity, :integer
  end
end

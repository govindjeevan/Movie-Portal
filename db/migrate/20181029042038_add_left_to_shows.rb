class AddLeftToShows < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :left, :integer
  end
end

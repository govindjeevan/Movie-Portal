class AddColumnsToShow < ActiveRecord::Migration[5.2]
  def change
    add_column :shows, :movie_name, :string
    add_column :shows, :theatre_name, :string
  end
end

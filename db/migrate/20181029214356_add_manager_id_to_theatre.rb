class AddManagerIdToTheatre < ActiveRecord::Migration[5.2]
  def change
    add_column :theatres, :manager_id, :integer
  end
end

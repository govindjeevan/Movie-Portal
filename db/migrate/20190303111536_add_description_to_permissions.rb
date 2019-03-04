class AddDescriptionToPermissions < ActiveRecord::Migration[5.2]
  def change
    add_column :permissions, :description, :text
  end
end

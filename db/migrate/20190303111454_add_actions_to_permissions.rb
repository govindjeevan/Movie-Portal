class AddActionsToPermissions < ActiveRecord::Migration[5.2]
  def change
    add_column :permissions, :actions, :string
  end
end

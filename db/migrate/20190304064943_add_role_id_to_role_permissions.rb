class AddRoleIdToRolePermissions < ActiveRecord::Migration[5.2]
  def change
    add_column :role_permissions, :role_id, :integer
  end
end

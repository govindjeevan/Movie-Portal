class AddPermissionIdToRolePermissions < ActiveRecord::Migration[5.2]
  def change
    add_column :role_permissions, :permission_id, :integer
  end
end

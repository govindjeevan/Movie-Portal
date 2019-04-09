class CreateRolePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :role_permissions do |t|
      t.integer :permission_id
      t.integer :role_id

      t.timestamps
    end
  end
end

class AddRoleIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :role_id, :integer
  end
end

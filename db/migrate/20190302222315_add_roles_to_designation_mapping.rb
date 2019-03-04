class AddRolesToDesignationMapping < ActiveRecord::Migration[5.2]
  def change
    add_column :designation_mappings, :roles, :text
  end
end

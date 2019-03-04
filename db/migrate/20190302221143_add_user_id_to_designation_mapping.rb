class AddUserIdToDesignationMapping < ActiveRecord::Migration[5.2]
  def change
    add_column :designation_mappings, :user_id, :integer
  end
end

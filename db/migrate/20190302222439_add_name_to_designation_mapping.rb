class AddNameToDesignationMapping < ActiveRecord::Migration[5.2]
  def change
    add_column :designation_mappings, :name, :string
  end
end

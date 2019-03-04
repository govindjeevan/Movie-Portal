class AddActiveToDesignationMapping < ActiveRecord::Migration[5.2]
  def change
    add_column :designation_mappings, :active, :boolean
  end
end

class CreateDesignationMappings < ActiveRecord::Migration[5.2]
  def change
    create_table :designation_mappings do |t|

      t.timestamps
    end
  end
end

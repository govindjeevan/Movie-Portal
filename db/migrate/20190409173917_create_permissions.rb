class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :actions
      t.string :subject_class
      t.text :description

      t.timestamps
    end
  end
end

class AddSubjectClassToPermissions < ActiveRecord::Migration[5.2]
  def change
    add_column :permissions, :subject_class, :string
  end
end

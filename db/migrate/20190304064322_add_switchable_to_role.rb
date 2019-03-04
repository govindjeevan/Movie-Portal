class AddSwitchableToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :switchable, :boolean
  end
end

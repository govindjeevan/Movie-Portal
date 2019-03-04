class AddBookingRoleToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :booking_role, :boolean
  end
end

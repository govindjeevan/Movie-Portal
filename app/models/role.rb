class Role < ApplicationRecord

  has_many :assignments
  has_many :users, :through => :assignments

  has_many :role_permissions
  has_many :permissions, :through => :role_permissions

end

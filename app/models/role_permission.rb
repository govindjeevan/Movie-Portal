class RolePermission < ApplicationRecord
  belongs_to :permission
  belongs_to :role
  self.primary_key = :role_id
end

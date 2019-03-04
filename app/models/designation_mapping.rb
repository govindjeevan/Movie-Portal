class DesignationMapping < ApplicationRecord
  belongs_to :user
  serialize :roles, Array
end

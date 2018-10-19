class Theatre < ApplicationRecord
  has_many :shows, dependent: :destroy
end

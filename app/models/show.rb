class Show < ApplicationRecord
  belongs_to :theatre

  has_many :bookings
end

class Geolocation < ApplicationRecord

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :altitude, presence: true

  belongs_to :carrier

end

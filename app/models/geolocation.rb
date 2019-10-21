class Geolocation < ApplicationRecord

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :altitude, presence: true

  belongs_to :carrier

  scope :where_carriers_passed_by, -> (params) {
    joins(:carrier).where('latitude = ? and longitude = ?',
      params[:latitude], params[:longitude])
  }

end

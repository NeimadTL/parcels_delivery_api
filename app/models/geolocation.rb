class Geolocation < ApplicationRecord

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :altitude, presence: true

  belongs_to :carrier

  scope :where_carriers_passed_by, -> (params) {
    joins(:carrier).where('latitude = ? and longitude = ?',
      params[:latitude], params[:longitude])
  }

  def to_h(options=nil)
    hash = {
      geolocation: "@#{self.latitude}, #{self.longitude}",
      carrier: ActiveModelSerializers::SerializableResource.new(self.carrier, {})
    }
  end

end

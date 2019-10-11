class Carrier < ApplicationRecord
  
  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
  validate :has_at_least_one_drivers_license, on: [:create, :update]


  def has_at_least_one_drivers_license
    unless self.has_driver_license_a || self.has_driver_license_b || self.has_driver_license_c
      errors[:base] << "You should at least have one driver's license"
    end
  end

end

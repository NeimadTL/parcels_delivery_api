class TransporterCompany < ApplicationRecord
  validates :name, presence: true
  validates :siret, presence: true, uniqueness: true
  validates_associated :post_codes
  validate :has_at_least_one_post_code, on: [:create, :update]
  validates_associated :carriers
  validate :has_at_least_one_carrier, on: [:create, :update]

  has_many :transporters_postcodes_relationships
  has_many :post_codes, through: :transporters_postcodes_relationships

  has_many :carriers

  def has_at_least_one_post_code
    if self.post_codes.nil? || self.post_codes.empty?
      errors[:base] << "Transporter should have at least have one post code"
    end
  end

  def has_at_least_one_carrier
    if self.post_codes.nil? || self.post_codes.empty?
      errors[:base] << "Transporter should have at least have one carrier"
    end
  end

end

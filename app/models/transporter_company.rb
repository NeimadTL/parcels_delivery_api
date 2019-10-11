class TransporterCompany < ApplicationRecord
  validates :name, presence: true
  validates :siret, presence: true, uniqueness: true

  has_many :transporters_postcodes_relationships
  has_many :post_codes, through: :transporters_postcodes_relationships

end

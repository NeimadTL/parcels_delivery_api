class PostCode < ApplicationRecord
  validates :code, presence: true

  has_many :transporters_postcodes_relationships
  has_many :transporter_companies, through: :transporters_postcodes_relationships
end

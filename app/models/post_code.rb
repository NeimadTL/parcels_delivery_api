class PostCode < ApplicationRecord
  validates :code, presence: true

  has_many :transporters_postcodes_relationships
  has_many :transporter_companies, through: :transporters_postcodes_relationships

  scope :where_there_are_transporters, -> { joins(:transporter_companies).distinct }
    
end

class PostCode < ApplicationRecord
  validates :code, presence: true

  has_many :transporters_postcodes_relationships
  has_many :transporter_companies, through: :transporters_postcodes_relationships

  scope :where_there_are_transporters, -> { joins(:transporter_companies).distinct }

  def to_h(options=nil)
    hash = {
      postal_code: self.code,
      transporters: ActiveModelSerializers::SerializableResource.new(self.transporter_companies, {})
    }
  end

end

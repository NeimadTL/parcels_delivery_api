class TransportersPostcodesRelationship < ApplicationRecord
  validates :transporter_company_id, presence: true
  validates :post_code_id, presence: true

  belongs_to :transporter_company
  belongs_to :post_code
end

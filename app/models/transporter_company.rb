class TransporterCompany < ApplicationRecord
  validates :name, presence: true
  validates :siret, presence: true
end

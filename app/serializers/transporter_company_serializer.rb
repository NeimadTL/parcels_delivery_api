class TransporterCompanySerializer < ActiveModel::Serializer
  attributes :name, :siret, :postal_codes

  def postal_codes
    object.post_codes.map { |post_code| post_code.code }
  end
end

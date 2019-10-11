class TransporterCompanySerializer < ActiveModel::Serializer
  attributes :name, :siret, :postal_codes, :carriers

  def postal_codes
    object.post_codes.map { |post_code| post_code.code }
  end

  def carriers
    ArraySerializer.new(object.carriers, each_serializer: CarrierSerializer)
  end
end

class TransporterCompanySerializer < ActiveModel::Serializer
  attributes :name, :siret, :postal_codes, :carriers

  def postal_codes
    object.post_codes.map { |post_code| post_code.code }
  end

  def carriers
    CollectionSerializer.new(object.carriers, each_serializer: CarrierSerializer)
    # ActiveModel::Serializer::CollectionSerializer
  end
end

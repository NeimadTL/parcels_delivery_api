class CarrierSerializer < ActiveModel::Serializer
  attributes :name, :age, :has_driver_license_a,
    :has_driver_license_b, :has_driver_license_c
end

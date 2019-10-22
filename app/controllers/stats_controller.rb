class StatsController < ApplicationController

  POSTCODE_TYPE = 'postcodes'
  GEOLOCATION_TYPE = 'geolocations'

  def transporters_by_postcodes
    @postcodes = PostCode.where_there_are_transporters
    render json: records_to_a(@postcodes, POSTCODE_TYPE)
  end

  def carriers_passed_by
    @geolocations = Geolocation.where_carriers_passed_by(geolocation_params)
    render json: records_to_a(@geolocations, GEOLOCATION_TYPE)
  end

  private

    def records_to_a(records, records_type)
      data = []
      records.to_a.each do |record|
        if records_type.eql? GEOLOCATION_TYPE
          hash = {
            geolocation: "@#{record.latitude}, #{record.longitude}",
            carrier: ActiveModelSerializers::SerializableResource.new(record.carrier, {})
          }
        elsif records_type.eql? POSTCODE_TYPE
          hash = {
            postal_code: record.code,
            transporters: ActiveModelSerializers::SerializableResource.new(record.transporter_companies, {})
          }
        end
        data.push(hash)
      end
      data
    end

    def geolocation_params
      params.permit(:latitude, :longitude)
    end

end

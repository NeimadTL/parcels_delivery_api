require 'set'

class StatsController < ApplicationController

  def transporters_by_postcodes
    @postcodes = PostCode.where_there_are_transporters
    render json: records_to_a(@postcodes)
  end

  def carriers_passed_by
    @geolocations = Geolocation.where_carriers_passed_by(geolocation_params)
    render json: records_to_a(@geolocations)
  end

  def transporter_with_carriers_passed_by
    @geolocations = Geolocation.where_carriers_passed_by(geolocation_params)
    transporters = extract_transporters(@geolocations)
    carriers = extract_carriers(@geolocations)
    render json: records_to_a(transporters, carriers: carriers)
  end

  private

    def records_to_a(records, options=nil)
      data = []
      records.to_a.each do |record|
        data.push(record.to_h(options))
      end
      data
    end

    def geolocation_params
      params.permit(:latitude, :longitude)
    end

    def extract_transporters(geolocations)
      transporters = Set.new
      geolocations.to_a.each do |geolocation|
        transporters.add(geolocation.carrier.transporter_company)
      end
      transporters
    end

    def extract_carriers(geolocations)
      carriers = []
      geolocations.to_a.each do |geolocation|
        carriers.push(geolocation.carrier)
      end
      carriers
    end

end

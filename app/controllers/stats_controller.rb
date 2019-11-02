require 'set'

class StatsController < ApplicationController

  before_action :set_latitude, only: [:carriers_passed_by, :transporter_with_carriers_passed_by]
  before_action :set_longitude, only: [:carriers_passed_by, :transporter_with_carriers_passed_by]

  def transporters_by_postcodes
    @postcodes = PostCode.where_there_are_transporters
    render json: records_to_a(@postcodes)
  end

  def carriers_passed_by
    @geolocations = Geolocation.where_carriers_passed_by(@latitude, @longitude)
    render json: records_to_a(@geolocations)
  end

  def transporter_with_carriers_passed_by
    @geolocations = Geolocation.where_carriers_passed_by(@latitude, @longitude)
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

    def set_latitude
      @latitude = geolocation_params[:latitude]
    end

    def set_longitude
      @longitude = geolocation_params[:longitude]
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

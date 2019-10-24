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
    transporters_set = Set.new
    carriers_set = Set.new
    @geolocations.to_a.each do |geolocation|
      carriers_set.add(geolocation.carrier)
      transporters_set.add(geolocation.carrier.transporter_company)
    end
    data = []
    transporters_set.each do |transporter|
      hash = {
        transporter: transporter,
        carriers: carriers_set
      }
      data.push(hash)
    end
    render json: data

  end

  private

    def records_to_a(records)
      data = []
      records.to_a.each do |record|
        data.push(record.to_h)
      end
      data
    end

    def geolocation_params
      params.permit(:latitude, :longitude)
    end

end

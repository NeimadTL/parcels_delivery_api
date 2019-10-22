class StatsController < ApplicationController

  def transporters_by_postcodes
    @postcodes = PostCode.where_there_are_transporters
    render json: records_to_a(@postcodes)
  end

  def carriers_passed_by
    @geolocations = Geolocation.where_carriers_passed_by(geolocation_params)
    render json: records_to_a(@geolocations)
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

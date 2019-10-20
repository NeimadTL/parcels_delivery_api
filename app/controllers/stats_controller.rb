class StatsController < ApplicationController

  def transporters_by_postcodes
    @postcodes = PostCode.where_there_are_transporters
    render json: transform_postcodes(@postcodes)
  end

  private

    def transform_postcodes(postcodes)
      array = []
      postcodes.to_a.each do |postcode|
        hash = {
          postal_code: postcode.code,
          transporters: ActiveModelSerializers::SerializableResource.new(postcode.transporter_companies, {})
        }
        array.push(hash)
      end
      array
    end

end

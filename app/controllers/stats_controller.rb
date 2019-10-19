class StatsController < ApplicationController

  def transporters_by_postcodes
    @postcodes = PostCode.where_there_are_transporters
    @postcodes = @postcodes.to_h { |postcode| [postcode.code, postcode.transporter_companies] }
    # @postcodes = @postcodes.transform_keys { |k| "postal_code: #{k}" }
    # @postcodes = @postcodes.transform_values { |v| "transporters: #{v}" }
    render json: @postcodes
  end

end

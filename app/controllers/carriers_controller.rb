class CarriersController < ApplicationController
  before_action :require_transporter_exist, only: [:index]
  before_action :set_carrier, only: [:update]
  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def index
    @carriers = Carrier.where(transporter_company_id: params[:id])

    render json: @carriers
  end

  def update
    geolocation = Geolocation.new(geolocation_params.merge(carrier_id: params[:id]))
    if geolocation.valid?
      @carrier.geolocation = geolocation
      render json: @carrier.geolocation
    else
      render json: geolocation.errors, status: :unprocessable_entity
    end
  end

  private

    def require_transporter_exist
       unless TransporterCompany.exists?(params[:id])
         raise ActiveRecord::RecordNotFound.new("Record with id='#{params[:id]}' not found")
       end
    end

    def show_errors(exception)
     render json: { message: "#{exception.message}" }, status: :not_found
    end

    def set_carrier
      @carrier = Carrier.find(params[:id])
    end

    def geolocation_params
      params.require(:geolocation).permit(:latitude, :longitude, :altitude)
    end

end

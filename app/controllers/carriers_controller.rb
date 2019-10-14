class CarriersController < ApplicationController
  before_action :require_transporter_exist, only: [:index]
  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

  def index
    @carriers = Carrier.where(transporter_company_id: params[:id])

    render json: @carriers
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

end

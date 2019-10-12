class TransporterCompaniesController < ApplicationController
  before_action :set_transporter_company, only: [:show, :update, :destroy]

  # GET /transporter_companies
  def index
    @transporter_companies = TransporterCompany.all

    render json: @transporter_companies
  end

  # GET /transporter_companies/1
  def show
    render json: @transporter_company
  end

  # POST /transporter_companies
  def create
    @transporter_company = TransporterCompany.new(name: transporter_company_params[:name], siret: transporter_company_params[:siret])
    transporter_company_params[:post_codes].each do |code|
      @transporter_company.post_codes.build(code: code)
    end
    transporter_company_params[:carriers].each do |carrier|
      @transporter_company.carriers.build(name: carrier["name"], age: carrier["age"],
      has_driver_license_a: carrier["has_driver_license_a"],
      has_driver_license_b: carrier["has_driver_license_b"],
      has_driver_license_c: carrier["has_driver_license_c"])
    end

    if @transporter_company.save
      render json: @transporter_company, status: :created, location: @transporter_company
    else
      render json: @transporter_company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transporter_companies/1
  def update
    if @transporter_company.update(transporter_company_params)
      render json: @transporter_company
    else
      render json: @transporter_company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transporter_companies/1
  def destroy
    @transporter_company.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transporter_company
      @transporter_company = TransporterCompany.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transporter_company_params
      params.require(:transporter_company).permit(:name, :siret,
        :post_codes => [], :carriers => [:name, :age, :has_driver_license_a,
          :has_driver_license_b, :has_driver_license_c])
    end
end

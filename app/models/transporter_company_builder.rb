module TransporterCompanyBuilder

  # creates a transporter
  def build_transporter(params)
    transporter = TransporterCompany.new(
                            name: params[:name],
                            siret: params[:siret])
    build_post_codes(params,transporter)
    build_carriers(params,transporter)
    transporter
  end

  # adds post codes to transporter
  def build_post_codes(params, transporter)
    params[:post_codes].each do |code|
      transporter.post_codes.build(code: code)
    end
  end

  # adds carriers to transporter
  def build_carriers(params, transporter)
    params[:carriers].each do |carrier|
      transporter.carriers.build(name: carrier["name"], age: carrier["age"],
      has_driver_license_a: carrier["has_driver_license_a"],
      has_driver_license_b: carrier["has_driver_license_b"],
      has_driver_license_c: carrier["has_driver_license_c"])
    end
  end
end

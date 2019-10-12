require 'rails_helper'

RSpec.describe TransporterCompaniesController, type: :controller do

  describe "when GET #index" do
    it 'returns http succes' do
      get :index, xhr: true
      expect(response).to have_http_status(:success)
    end

    it 'returns all the transporter companies' do
      get :index, xhr: true
      parsed_response = JSON.parse(response.body)

      # number of transporter companies
      expect(parsed_response.length).to eq(3)

      # DHL transporter
      expect(parsed_response[0]['name']).to eq("DHL")
      expect(parsed_response[0]['siret']).to eq("12345678912345")
      expect(parsed_response[0]['postal_codes'][0]).to eq("75000")
      expect(parsed_response[0]['postal_codes'][1]).to eq("59000")
      expect(parsed_response[0]['postal_codes'][2]).to eq("34000")

      # DHL transporter first carrier
      expect(parsed_response[0]['carriers'][0]['name']).to eq("John")
      expect(parsed_response[0]['carriers'][0]['age']).to eq 23
      expect(parsed_response[0]['carriers'][0]['has_driver_license_a']).to eq false
      expect(parsed_response[0]['carriers'][0]['has_driver_license_b']).to eq false
      expect(parsed_response[0]['carriers'][0]['has_driver_license_c']).to eq true

      # DHL transporter second carrier
      expect(parsed_response[0]['carriers'][1]['name']).to eq("Isidro")
      expect(parsed_response[0]['carriers'][1]['age']).to eq 36
      expect(parsed_response[0]['carriers'][1]['has_driver_license_a']).to eq false
      expect(parsed_response[0]['carriers'][1]['has_driver_license_b']).to eq true
      expect(parsed_response[0]['carriers'][1]['has_driver_license_c']).to eq false

      # DHL transporter third carrier
      expect(parsed_response[0]['carriers'][2]['name']).to eq("Martin")
      expect(parsed_response[0]['carriers'][2]['age']).to eq 42
      expect(parsed_response[0]['carriers'][2]['has_driver_license_a']).to eq false
      expect(parsed_response[0]['carriers'][2]['has_driver_license_b']).to eq true
      expect(parsed_response[0]['carriers'][2]['has_driver_license_c']).to eq false

    end
  end

  describe "when POST #create " do
    it "should save transporter with all its data" do
      post :create, xhr: true, params: {
        transporter_company: { name: "new transporter", siret: "35786763874426",
          post_codes: ['54000', '33000', '45000'],
          carriers: [ { name: 'Frederic', age: 39, has_driver_license_a: true,
            has_driver_license_b: false, has_driver_license_c: false },
            { name: 'Bryan', age: 59, has_driver_license_a: true,
              has_driver_license_b: false, has_driver_license_c: true }
             ] } }
      expect(response).to have_http_status(:success)
      created_tranporter = TransporterCompany.last
      expect(created_tranporter.name).to eq "new transporter"
      expect(created_tranporter.siret).to eq "35786763874426"

      # number of post codes
      expect(created_tranporter.post_codes.count).to eq 3

      # each post code value
      expect(created_tranporter.post_codes[0].code).to eq '54000'
      expect(created_tranporter.post_codes[1].code).to eq '33000'
      expect(created_tranporter.post_codes[2].code).to eq '45000'

      # number of carriers
      expect(created_tranporter.carriers.count).to eq 2

      # first carrier
      expect(created_tranporter.carriers[0].name).to eq 'Frederic'
      expect(created_tranporter.carriers[0].age).to eq 39
      expect(created_tranporter.carriers[0].has_driver_license_a).to eq true
      expect(created_tranporter.carriers[0].has_driver_license_b).to eq false
      expect(created_tranporter.carriers[0].has_driver_license_c).to eq false

      # second carrier
      expect(created_tranporter.carriers[1].name).to eq 'Bryan'
      expect(created_tranporter.carriers[1].age).to eq 59
      expect(created_tranporter.carriers[1].has_driver_license_a).to eq true
      expect(created_tranporter.carriers[1].has_driver_license_b).to eq false
      expect(created_tranporter.carriers[1].has_driver_license_c).to eq true
    end
  end

end

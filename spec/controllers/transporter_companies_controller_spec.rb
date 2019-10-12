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

end

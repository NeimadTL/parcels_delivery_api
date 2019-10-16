require 'rails_helper'

RSpec.describe CarriersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      dhl_transporter = TransporterCompany.find_by(name: 'DHL')
      get :index, xhr: true, params: { id: dhl_transporter.id }
      expect(response).to have_http_status(:success)
    end

    it "returns all carriers when transporter exists" do
      dhl_transporter = TransporterCompany.find_by(name: 'DHL')
      get :index, xhr: true, params: { id: dhl_transporter.id }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(3)

      # DHL transporter first carrier
      expect(parsed_response[0]['name']).to eq("John")
      expect(parsed_response[0]['age']).to eq 23
      expect(parsed_response[0]['has_driver_license_a']).to eq false
      expect(parsed_response[0]['has_driver_license_b']).to eq false
      expect(parsed_response[0]['has_driver_license_c']).to eq true

      # DHL transporter second carrier
      expect(parsed_response[1]['name']).to eq("Isidro")
      expect(parsed_response[1]['age']).to eq 36
      expect(parsed_response[1]['has_driver_license_a']).to eq false
      expect(parsed_response[1]['has_driver_license_b']).to eq true
      expect(parsed_response[1]['has_driver_license_c']).to eq false

      # DHL transporter third carrier
      expect(parsed_response[2]['name']).to eq("Martin")
      expect(parsed_response[2]['age']).to eq 42
      expect(parsed_response[2]['has_driver_license_a']).to eq false
      expect(parsed_response[2]['has_driver_license_b']).to eq true
      expect(parsed_response[2]['has_driver_license_c']).to eq false
    end

    it "returns http not foud when transporter doesn't exist" do
      get :index, xhr: true, params: { id: 9999 }
      expect(response).to have_http_status(:not_found)
    end

    it "returns error when transporter doesn't exist" do
      not_found_id = 9999
      get :index, xhr: true, params: { id: not_found_id }
      expect(response).to have_http_status(:not_found)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['message']).to eq("Record with id='#{not_found_id}' not found")
    end
  end

  describe "PUT #update" do
    it "returns http success when all parameters are passed" do
      john = Carrier.find_by(name: 'John')
      expect {
        put :update, xhr: true, params: { id: john.id,
          geolocation: { latitude: 2.39, longitude: 3893.383, altitude: 34.384 } }
      }.to change(Geolocation, :count)
      expect(response).to have_http_status(:success)
      expect(john.geolocation.latitude).to eq 2.39
      expect(john.geolocation.longitude).to eq 3893.383
      expect(john.geolocation.altitude).to eq 34.384
    end

    it "returns http unprocessable entity when parameters are missing" do
      john = Carrier.find_by(name: 'John')
      expect {
        put :update, xhr: true, params: { id: john.id,
          geolocation: { latitude: 2.39, longitude: 3893.383, altitude: nil } }
      }.to_not change(Geolocation, :count)
      expect(response).to have_http_status(:unprocessable_entity)
      expect(john.geolocation).to eq nil
      parsed_response = JSON.parse(response.body)
      puts "parsed_response -> #{parsed_response}"
      expect(parsed_response['altitude'][0]).to eq("can't be blank")
    end
  end

end

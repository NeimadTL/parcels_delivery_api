require 'rails_helper'

RSpec.describe StatsController, type: :controller do

  describe "GET #transporters_by_postcodes" do
    it "returns http success" do
      get :transporters_by_postcodes, xhr: true
      expect(response).to have_http_status(:success)
    end

    it 'returns all the transporter companies' do
      get :transporters_by_postcodes, xhr: true
      parsed_response = JSON.parse(response.body)

      # number of hashes {postal_code: "", transporters: []}
      expect(parsed_response.length).to eq(3)

      # Paris
      expect(parsed_response[0]['postal_code']).to eq("75000")
      # has 2 transporters :
      expect(parsed_response[0]['transporters'].length).to eq 2
      # one is DHL
      expect(parsed_response[0]['transporters'][0]['name']).to eq("DHL")
        # which is located in 3 places
      expect(parsed_response[0]['transporters'][0]['postal_codes'].length).to eq 3
        # and which has 3 carriers
      expect(parsed_response[0]['transporters'][0]['carriers'].length).to eq 3
      # second is UPS
      expect(parsed_response[0]['transporters'][1]['name']).to eq("UPS")
        # which is located in 2 places
      expect(parsed_response[0]['transporters'][1]['postal_codes'].length).to eq 2
        # and which has 2 carriers
      expect(parsed_response[0]['transporters'][1]['carriers'].length).to eq 2


      # Lille
      expect(parsed_response[1]['postal_code']).to eq("59000")
      # has 1 transporter :
      expect(parsed_response[1]['transporters'].length).to eq 1
      # one is DHL
      expect(parsed_response[1]['transporters'][0]['name']).to eq("DHL")
        # which is located in 3 places
      expect(parsed_response[1]['transporters'][0]['postal_codes'].length).to eq 3
        # and which has 3 carriers
      expect(parsed_response[1]['transporters'][0]['carriers'].length).to eq 3


      # Montpellier
      expect(parsed_response[2]['postal_code']).to eq("34000")
      # has 3 transporters :
      expect(parsed_response[2]['transporters'].length).to eq 3
      # one is DHL
      expect(parsed_response[2]['transporters'][0]['name']).to eq("DHL")
        # which is located in 3 places
      expect(parsed_response[2]['transporters'][0]['postal_codes'].length).to eq 3
        # and which has 3 carriers
      expect(parsed_response[2]['transporters'][0]['carriers'].length).to eq 3
      # second is UPS
      expect(parsed_response[2]['transporters'][1]['name']).to eq("UPS")
        # which is located in 2 places
      expect(parsed_response[2]['transporters'][1]['postal_codes'].length).to eq 2
        # and which has 2 carriers
      expect(parsed_response[2]['transporters'][1]['carriers'].length).to eq 2
      # third is FEDEX
      expect(parsed_response[2]['transporters'][2]['name']).to eq("FEDEX")
        # which is located in 1 place
      expect(parsed_response[2]['transporters'][2]['postal_codes'].length).to eq 1
        # and which has 2 carriers
      expect(parsed_response[2]['transporters'][2]['carriers'].length).to eq 1



    end

  end

end

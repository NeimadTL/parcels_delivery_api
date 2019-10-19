require 'rails_helper'

RSpec.describe StatsController, type: :controller do

  describe "GET #transporters_by_postcodes" do
    it "returns http success" do
      get :transporters_by_postcodes, xhr: true
      expect(response).to have_http_status(:success)
    end
  end

end

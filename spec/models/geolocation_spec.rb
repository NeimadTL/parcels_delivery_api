require 'rails_helper'

RSpec.describe Geolocation, type: :model do

  it { should belong_to(:carrier) }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
  it { should validate_presence_of :altitude }

  describe "scope #where_carriers_passed_by " do
    before do
      @geolocations = Geolocation.where_carriers_passed_by( { latitude: 9393.393, longitude: 32.63 } )
    end

    it "should retreive geolocations where carriers passed by" do
      expect(@geolocations).to_not be_empty
      expect(@geolocations.count).to eql 2
      expect(@geolocations[0].latitude).to eql 9393.393
      expect(@geolocations[0].longitude).to eql 32.63
      expect(@geolocations[1].latitude).to eql 9393.393
      expect(@geolocations[1].longitude).to eql 32.63
    end
  end

end

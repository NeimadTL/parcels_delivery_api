require 'rails_helper'

RSpec.describe Carrier, type: :model do

  it { should validate_presence_of :name }
  it { should validate_numericality_of :age }

  it { should belong_to(:transporter_company) }

  describe "when carrier has no driver's license" do
    before do
      dhl = TransporterCompany.find_by(name: 'DHL')
      @john = Carrier.create(
        name: "John", age: 23, has_driver_license_a: false,
        has_driver_license_b: false, has_driver_license_c: false,
        transporter_company_id: dhl.id)
    end

    it "should not be valid" do
      expect(@john).to_not be_valid
      expect(@john.errors[:base]).to include("You should at least have one driver's license")
    end
  end

  describe "when carrier has at least one driver's license" do
    before do
      dhl = TransporterCompany.find_by(name: 'DHL')
      @john = Carrier.create(
        name: "John", age: 23, has_driver_license_a: true,
        has_driver_license_b: false,has_driver_license_c: false,
        transporter_company_id: dhl.id)
    end

    it "should be valid" do
      expect(@john).to be_valid
      expect(@john.errors[:base]).to be_empty
    end
  end


end

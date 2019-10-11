require 'rails_helper'

RSpec.describe Carrier, type: :model do

  it { should validate_presence_of :name }
  it { should validate_numericality_of :age }

  describe "when carrier has no driver's license" do
    before do
      @john = Carrier.create(
        name: "John", age: 23, has_driver_license_a: false,
        has_driver_license_b: false,has_driver_license_c: false)
    end

    it "should not be valid" do
      @john.should_not be_valid
      @john.errors[:base].should include("You should at least have one driver's license")
    end
  end

  describe "when carrier has at least one driver's license" do
    before do
      @john = Carrier.create(
        name: "John", age: 23, has_driver_license_a: true,
        has_driver_license_b: false,has_driver_license_c: false)
    end

    it "should be valid" do
      @john.should be_valid
      @john.errors[:base].should be_empty
    end
  end


end

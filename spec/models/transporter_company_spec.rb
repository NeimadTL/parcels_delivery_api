require 'rails_helper'

RSpec.describe TransporterCompany, type: :model do

  it { should validate_presence_of :name }
  it { should validate_presence_of :siret }
  it { should validate_uniqueness_of(:siret).case_insensitive }

  it { should have_many(:transporters_postcodes_relationships) }
  it { should have_many(:post_codes).through(:transporters_postcodes_relationships) }

  it { should have_many(:carriers) }


  describe "when transporter has no post code" do
    before do
      @transporter = TransporterCompany.create(name: 'DHL', siret: '12345678912345')
    end

    it "should not be valid" do
      expect(@transporter).to_not be_valid
      expect(@transporter.errors[:base]).to include("Transporter should have at least have one post code")
      expect(@transporter.errors[:base]).to include("Transporter should have at least have one carrier")
    end
  end

end

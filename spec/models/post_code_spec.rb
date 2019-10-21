require 'rails_helper'

RSpec.describe PostCode, type: :model do

  it { should validate_presence_of :code }

  it { should have_many(:transporters_postcodes_relationships) }
  it { should have_many(:transporter_companies).through(:transporters_postcodes_relationships) }

  describe "scope #where_there_are_transporters" do
    before do
      @post_codes = PostCode.where_there_are_transporters
    end

    it "should retrieve post codes where there are transporters" do
      expect(@post_codes).to_not be_empty
      expect(@post_codes.count).to eql 3
      expect(@post_codes[0].code).to eql "75000"
      expect(@post_codes[1].code).to eql "59000"
      expect(@post_codes[2].code).to eql "34000"
    end
  end

end

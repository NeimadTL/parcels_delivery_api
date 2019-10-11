require 'rails_helper'

RSpec.describe PostCode, type: :model do

  it { should validate_presence_of :code }

  it { should have_many(:transporters_postcodes_relationships) }
  it { should have_many(:transporter_companies).through(:transporters_postcodes_relationships) }
  
end

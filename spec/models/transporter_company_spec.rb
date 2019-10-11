require 'rails_helper'

RSpec.describe TransporterCompany, type: :model do

  it { should validate_presence_of :name }
  it { should validate_presence_of :siret }
  it { should validate_uniqueness_of :siret }

  it { should have_many(:transporters_postcodes_relationships) }
  it { should have_many(:post_codes).through(:transporters_postcodes_relationships) }

  it { should have_many(:carriers) }

end

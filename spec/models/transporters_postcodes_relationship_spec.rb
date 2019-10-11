require 'rails_helper'

RSpec.describe TransportersPostcodesRelationship, type: :model do

  it { should validate_presence_of :transporter_company_id }
  it { should validate_presence_of :post_code_id }

  it { should belong_to(:transporter_company) }
  it { should belong_to(:post_code) }

end

require 'rails_helper'

RSpec.describe Geolocation, type: :model do

  it { should belong_to(:carrier) }
  
end

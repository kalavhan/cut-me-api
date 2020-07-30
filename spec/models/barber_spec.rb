require 'rails_helper'

RSpec.describe Barber, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:role) }
  it { should have_many(:services) }
  it { should have_many(:appointments) }
end

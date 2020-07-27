require 'rails_helper'

RSpec.describe Barber, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:role) }
end

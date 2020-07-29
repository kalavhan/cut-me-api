require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should validate_presence_of(:barber_id) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }
  it { should belong_to(:barber) }
end

require 'rails_helper'

RSpec.describe Service, type: :model do
  it { should validate_presence_of(:barber_id) }

  it { should validate_presence_of(:title) }
  it { should allow_value('Dying hair').for(:title) }
  it { should_not allow_value((0..80).map { ('a'..'z').to_a[rand(26)] }.join).for(:title) }

  it { should validate_presence_of(:price) }
  it { should belong_to(:barber) }
end

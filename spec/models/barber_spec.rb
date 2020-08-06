require 'rails_helper'

RSpec.describe Barber, type: :model do
  it { should validate_presence_of(:name) }
  it { should allow_value('Anthony Edward').for(:name) }
  it { should_not allow_value((0..100).map { ('a'..'z').to_a[rand(26)] }.join).for(:name) }

  it { should validate_presence_of(:last_name) }
  it { should allow_value('Stark').for(:last_name) }
  it { should_not allow_value((0..40).map { ('a'..'z').to_a[rand(26)] }.join).for(:last_name) }

  it { should validate_presence_of(:role) }
  it { should allow_value('Master Barber').for(:role) }
  it { should_not allow_value((0..50).map { ('a'..'z').to_a[rand(26)] }.join).for(:role) }

  it { should have_many(:services) }
  it { should have_many(:services).dependent(:destroy) }

  it { should have_many(:appointments) }
  it { should have_many(:appointments).dependent(:destroy) }
end

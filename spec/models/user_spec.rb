require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should allow_value("foo@bar.com").for(:email) }
  it { should_not allow_value("foo.com").for(:email) }
  it { should_not allow_value((0..255).map { ('a'..'z').to_a[rand(26)] }.join).for(:email) }

  it { should have_secure_password }
  it { should validate_presence_of(:password) }
  it { should allow_value("aPf4z8097").for(:password) }
  it { should_not allow_value("u3o").for(:password) }

  it { should validate_presence_of(:name) }
  it { should allow_value("Jhon Foo").for(:name) }
  it { should_not allow_value((0..100).map { ('a'..'z').to_a[rand(26)] }.join).for(:name) }

  it { should validate_presence_of(:last_name) }
  it { should allow_value('bar').for(:last_name) }
  it { should_not allow_value((0..40).map { ('a'..'z').to_a[rand(26)] }.join).for(:last_name)}
  
  it { should have_many(:appointments) }
  it { should have_many(:appointments).dependent(:destroy) }
end

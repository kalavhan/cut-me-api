FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf' }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end

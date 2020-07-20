FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password_digest { Faker::Alphanumeric.alpha(number: 10) }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
  end
end
FactoryBot.define do
  factory :todo do
    email { Faker::Internet.unique.email }
    password { Faker::Alphanumeric.alpha(number: 10) }
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    created_by { Faker::Number.number(10) }
  end
end
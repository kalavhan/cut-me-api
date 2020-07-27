FactoryBot.define do
  factory :barber do
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { Faker::Job.field}
    image { 'no-image' }
  end
end
FactoryBot.define do
  factory :service do
    association :barber
    title { Faker::Job.title }
    price { 15 }
  end
end

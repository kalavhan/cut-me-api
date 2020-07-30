FactoryBot.define do
  factory :service do
    association :barber
    title { Faker::Job.title }
  end
end

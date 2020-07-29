FactoryBot.define do
  factory :appointment do
    appt_date { Faker::Date.between(from: '2020-09-23', to: '2020-09-25') }
    appt_time { '14:35' }
    association :barber
    association :user
  end
end
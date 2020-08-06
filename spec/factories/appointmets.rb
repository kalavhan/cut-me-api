FactoryBot.define do
  factory :appointment do
    appt_date { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long) }
    association :barber
    association :user
  end
end

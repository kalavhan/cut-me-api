FactoryBot.define do
  factory :user do
    email { Faker::Internet.email}
    password { 'asdfasdf' }
    password_confirmation { 'asdfasdf'}
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
  end
end
FactoryBot.define do
  factory :user do
    name { Faker::Name.name_with_middle }
    password { Faker::Bitcoin.address }
    email { Faker::Internet.email }
  end
end

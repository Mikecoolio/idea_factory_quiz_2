FactoryBot.define do
  PASS = "12"
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email { Faker::Internet.email}
    password {"#{PASS}"}
  end
end

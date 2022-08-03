require 'faker'

FactoryBot.define do
    factory :idea do
        sequence(:title) { |n| Faker::Lorem.word}
        body { Faker::Lorem.paragraph}
    end
end
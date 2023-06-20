require 'faker'

FactoryBot.define do
  factory :task do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    due_date { Faker::Date.forward }
    completed { false }
    user
  end
end

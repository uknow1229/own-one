FactoryBot.define do
  factory :post_workout do
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    title { Faker::Lorem.characters(number: 20) }
    site { 0 }
    time { Faker::Time.between(from: DateTime.now.beginning_of_day, to: DateTime.now.end_of_day) }
    memo { Faker::Lorem.characters(number: 100) }
    association :end_user
  end
end
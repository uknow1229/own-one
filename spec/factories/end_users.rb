FactoryBot.define do
  factory :end_user do
    user_name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }

    after(:build) do |end_user|
      end_user.profile_image.attach(io: File.open("spec/images/no_image.jpg"), filename: "no_image.jpg", content_type: "application/xlsx")
    end
  end
end

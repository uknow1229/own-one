# # EndUser Data
10.times do
  EndUser.create!(
    user_name:  Faker::Name.user_name ,
    height: 160,
    body_weight: 50,
    age: 25,
    sex: 0,
    target_weight: 48,
    target_calorie: 400,
    activelevel: 1,
    introduction: "よろしくお願いします。",
    email: Faker::Internet.email(),
    password: "testtest"
  )
end


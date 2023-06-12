# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Admin User Data
Admin.create!(
  last_name: "中山" ,
  first_name: "きんに君" ,
  email: "test3@test.com" ,
  password: "testtest"
)

# EndUser Data
EndUser.create!(
  last_name: "中山" ,
  first_name: "きんに君" ,
  height: 160,
  body_weight: 50,
  age: 25,
  sex: 0,
  target_weight: 48,
  target_calorie: 400,
  activelevel: 1,
  introduction: "よろしくお願いします。",
  email: "test4@test.com" ,
  password: "testtest"
)

# PostWorkouts Data
EndUser.all.each do |end_user|
  PostWorkout.create!(
    date: Date.today,
    title: "今日の筋トレ",
    site: 0,
    time: "60",
    memo: "スクワットは股関節をロックしないようにし、しっかり降ろして行う。"
  )
end

# PostMeals Data
EndUser.all.each do |end_user|
  PostMeal.create!(
    date: Date.today,
    timing: 1,
    meal_type: 1,
    memo: "トレーナーさんに教わったプロテインを1回30g、1日3回ずつ飲んで、タンパク質を摂取する。"
  )
end

# PostBlogs Data
EndUser.all.each do |end_user|
  PostBlog.create!(
    title: "トレーニングの頻度",
    content: "あまりに頻繁にトレーニングを繰り返していると回数や重量がかえって低下してしまうことがあります。
    十分に回復し、身体が充実したタイミングを見計らってトレーニングに挑むのが理想的です。",
  )
end

# Workout Tags Data
WorkoutTag.create([
  { name: '筋トレ' },
  { name: '家トレ' },
  { name: '宅トレ' },
  { name: '筋トレ仲間と繋がりたい' },
])

# Meal Tags Data
MealTag.create([
  { name: 'PFCバランス' },
  { name: 'プロテイン' }
])
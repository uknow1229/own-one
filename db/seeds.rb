# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Admin User Data
Admin.create!(
  user_name: "きんに君" ,
  email: "test3@test.com" ,
  password: "testtest"
)

# EndUser Data
EndUser.create!(
  user_name: "きんに君" ,
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
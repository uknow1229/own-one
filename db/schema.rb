# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_06_18_103009) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "blog_comments", force: :cascade do |t|
    t.bigint "end_user_id", null: false
    t.bigint "post_blog_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_blog_comments_on_end_user_id"
    t.index ["post_blog_id"], name: "index_blog_comments_on_post_blog_id"
  end

  create_table "blog_likes", force: :cascade do |t|
    t.bigint "end_user_id", null: false
    t.bigint "post_blog_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_blog_likes_on_end_user_id"
    t.index ["post_blog_id"], name: "index_blog_likes_on_post_blog_id"
  end

  create_table "blog_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_blog_tags_on_name", unique: true
  end

  create_table "end_users", force: :cascade do |t|
    t.string "user_name"
    t.string "last_name"
    t.string "first_name"
    t.integer "height"
    t.integer "body_weight"
    t.integer "age"
    t.integer "sex", default: 0
    t.integer "target_weight"
    t.integer "target_calorie"
    t.integer "activelevel", default: 0
    t.text "introduction"
    t.boolean "is_deleted", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_end_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_end_users_on_reset_password_token", unique: true
  end

  create_table "meal_comments", force: :cascade do |t|
    t.bigint "end_user_id", null: false
    t.bigint "post_meal_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_meal_comments_on_end_user_id"
    t.index ["post_meal_id"], name: "index_meal_comments_on_post_meal_id"
  end

  create_table "meal_likes", force: :cascade do |t|
    t.bigint "end_user_id", null: false
    t.bigint "post_meal_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_meal_likes_on_end_user_id"
    t.index ["post_meal_id"], name: "index_meal_likes_on_post_meal_id"
  end

  create_table "meal_menus", force: :cascade do |t|
    t.bigint "post_meal_id", null: false
    t.string "title"
    t.string "quantity"
    t.integer "calorie"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_meal_id"], name: "index_meal_menus_on_post_meal_id"
  end

  create_table "meal_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_meal_tags_on_name", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.string "subject_type"
    t.integer "subject_id"
    t.integer "end_user_id"
    t.integer "action_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "checked", default: false, null: false
    t.integer "visitor_id"
    t.integer "visited_id"
    t.index ["end_user_id"], name: "index_notifications_on_end_user_id"
    t.index ["subject_type", "subject_id"], name: "index_notifications_on_subject"
  end

  create_table "post_blog_tags", force: :cascade do |t|
    t.bigint "post_blog_id", null: false
    t.bigint "blog_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_tag_id"], name: "index_post_blog_tags_on_blog_tag_id"
    t.index ["post_blog_id", "blog_tag_id"], name: "index_post_blog_tags_on_post_blog_id_and_blog_tag_id", unique: true
    t.index ["post_blog_id"], name: "index_post_blog_tags_on_post_blog_id"
  end

  create_table "post_blogs", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.string "title", null: false
    t.datetime "start_time", null: false
    t.text "content", null: false
    t.boolean "is_closed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_post_blogs_on_end_user_id"
  end

  create_table "post_meal_tags", force: :cascade do |t|
    t.bigint "post_meal_id", null: false
    t.bigint "meal_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["meal_tag_id"], name: "index_post_meal_tags_on_meal_tag_id"
    t.index ["post_meal_id", "meal_tag_id"], name: "index_post_meal_tags_on_post_meal_id_and_meal_tag_id", unique: true
    t.index ["post_meal_id"], name: "index_post_meal_tags_on_post_meal_id"
  end

  create_table "post_meals", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.datetime "start_time"
    t.integer "timing", default: 0
    t.integer "meal_type", default: 0
    t.text "memo"
    t.boolean "is_closed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_post_meals_on_end_user_id"
  end

  create_table "post_workout_tags", force: :cascade do |t|
    t.bigint "post_workout_id", null: false
    t.bigint "workout_tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_workout_id", "workout_tag_id"], name: "index_post_workout_tags_on_post_workout_id_and_workout_tag_id", unique: true
    t.index ["post_workout_id"], name: "index_post_workout_tags_on_post_workout_id"
    t.index ["workout_tag_id"], name: "index_post_workout_tags_on_workout_tag_id"
  end

  create_table "post_workouts", force: :cascade do |t|
    t.integer "end_user_id", null: false
    t.datetime "start_time"
    t.string "title"
    t.integer "site", default: 0
    t.string "time"
    t.text "memo"
    t.integer "is_disclosure", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_post_workouts_on_end_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "weights", force: :cascade do |t|
    t.float "value"
    t.datetime "start_time"
    t.integer "end_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_weights_on_end_user_id"
  end

  create_table "workout_comments", force: :cascade do |t|
    t.bigint "end_user_id", null: false
    t.bigint "post_workout_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_workout_comments_on_end_user_id"
    t.index ["post_workout_id"], name: "index_workout_comments_on_post_workout_id"
  end

  create_table "workout_likes", force: :cascade do |t|
    t.bigint "end_user_id", null: false
    t.bigint "post_workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["end_user_id"], name: "index_workout_likes_on_end_user_id"
    t.index ["post_workout_id"], name: "index_workout_likes_on_post_workout_id"
  end

  create_table "workout_menus", force: :cascade do |t|
    t.bigint "post_workout_id"
    t.string "title"
    t.float "weight"
    t.integer "reptition_count"
    t.integer "set_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_workout_id"], name: "index_workout_menus_on_post_workout_id"
  end

  create_table "workout_tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_workout_tags_on_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blog_comments", "end_users"
  add_foreign_key "blog_comments", "post_blogs"
  add_foreign_key "blog_likes", "end_users"
  add_foreign_key "blog_likes", "post_blogs"
  add_foreign_key "meal_comments", "end_users"
  add_foreign_key "meal_comments", "post_meals"
  add_foreign_key "meal_likes", "end_users"
  add_foreign_key "meal_likes", "post_meals"
  add_foreign_key "meal_menus", "post_meals"
  add_foreign_key "notifications", "end_users"
  add_foreign_key "post_blog_tags", "blog_tags"
  add_foreign_key "post_blog_tags", "post_blogs"
  add_foreign_key "post_blogs", "end_users"
  add_foreign_key "post_meal_tags", "meal_tags"
  add_foreign_key "post_meal_tags", "post_meals"
  add_foreign_key "post_meals", "end_users"
  add_foreign_key "post_workout_tags", "post_workouts"
  add_foreign_key "post_workout_tags", "workout_tags"
  add_foreign_key "post_workouts", "end_users"
  add_foreign_key "weights", "end_users"
  add_foreign_key "workout_comments", "end_users"
  add_foreign_key "workout_comments", "post_workouts"
  add_foreign_key "workout_likes", "end_users"
  add_foreign_key "workout_likes", "post_workouts"
  add_foreign_key "workout_menus", "post_workouts"
end

class CreatePostMealTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_meal_tags do |t|
      t.references :post_meal, null: false, foreign_key: true
      t.references :meal_tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_meal_tags, [:post_meal_id,:meal_tag_id],unique: true
  end
end

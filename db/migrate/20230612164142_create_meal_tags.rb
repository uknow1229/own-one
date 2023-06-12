class CreateMealTags < ActiveRecord::Migration[6.1]
  def change
    create_table :meal_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :meal_tags, :name, unique:true
  end
end

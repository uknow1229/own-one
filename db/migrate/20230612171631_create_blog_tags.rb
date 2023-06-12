class CreateBlogTags < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :meal_tags, :name, unique:true
  end
end

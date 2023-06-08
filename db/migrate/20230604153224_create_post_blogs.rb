class CreatePostBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :post_blogs do |t|
      t.references :end_user, foreign_key: true, null: false
      t.string :title,  null: false
      t.text :content,  null: false 
      t.boolean:is_closed,  default: false

      t.timestamps
    end
  end
end

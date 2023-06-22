class CreateBlogLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_likes do |t|
      t.references :end_user, type: :bigint, foreign_key: true, null: false
      t.references :post_blog, type: :integer, foreign_key: true, null: false

      t.timestamps
    end
  end
end

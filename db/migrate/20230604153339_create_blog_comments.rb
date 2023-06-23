class CreateBlogComments < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_comments do |t|
      t.references :end_user, type: :bigint, null: false, foreign_key: true
      t.references :post_blog, type: :bigint, null: false, foreign_key: true
      t.text :comment,    null: false

      t.timestamps
    end
  end
end

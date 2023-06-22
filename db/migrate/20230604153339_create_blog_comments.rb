class CreateBlogComments < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_comments do |t|
      t.bigint :end_user_id, null: false
      t.references :post_blog, type: :integer, null: false, foreign_key: true
      t.text :comment,    null: false

      t.timestamps
      add_foreign_key :blog_comments :end_users
    end
  end
end

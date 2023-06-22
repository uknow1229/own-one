class CreatePostBlogTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_blog_tags do |t|
      t.references :post_blog, type: :integer, null: false, foreign_key: true
      t.references :blog_tag, type: :integer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :post_blog_tags, [:post_blog_id,:blog_tag_id],unique: true
  end
end

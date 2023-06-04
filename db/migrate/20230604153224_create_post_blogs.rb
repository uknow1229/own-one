class CreatePostBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :post_blogs do |t|

      t.timestamps
    end
  end
end

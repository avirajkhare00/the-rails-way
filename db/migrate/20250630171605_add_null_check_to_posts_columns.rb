class AddNullCheckToPostsColumns < ActiveRecord::Migration[8.0]
  def change
    change_column_null :posts, :title, false
    change_column_null :posts, :content, false
  end
end

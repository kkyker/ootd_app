class RemoveAuthorColumnFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :author, :string
  end
end

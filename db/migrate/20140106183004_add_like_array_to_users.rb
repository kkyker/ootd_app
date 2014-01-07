#Made mistake, actually added it to posts.

class AddLikeArrayToUsers < ActiveRecord::Migration
  def change
  	add_column :posts, :liked_users, :string
  end
end

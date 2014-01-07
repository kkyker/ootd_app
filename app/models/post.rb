class Post < ActiveRecord::Base
	belongs_to :user
	validates :content, presence: true
	validates :user_id, presence: true
	serialize :liked_users, Array
	has_attached_file :image
end

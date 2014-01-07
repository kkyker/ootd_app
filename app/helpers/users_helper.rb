module UsersHelper
	def total_price(posts)
		total = 0
		posts.each do |post|
			total += post.price
		end
		return total
	end

	def average_price(posts)
		if posts.count == 0
			return 0
		end
		total = total_price(posts)
		return total/(posts.count)
	end

	def total_likes(posts)
		total = 0
		posts.each do |post|
			total += post.likes
		end
		return total
	end

	def average_likes(posts)
		if posts.count == 0
			return 0
		end
		total = total_likes(posts)
		return total/(posts.count)
	end
end

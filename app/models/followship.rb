class Followship < ActiveRecord::Base

	def follower
		User.find(follower_id)
	end

	def followee
		User.find(followee_id)
	end
end

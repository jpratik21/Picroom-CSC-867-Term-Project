class User < ActiveRecord::Base
    has_secure_password
    
	has_many :photos
	has_many :comments

    mount_uploader :image, ImageUploader

	scope :sorted, lambda { order("users.user_name ASC")}

	def followingpictures
        followships = Followship.select("followee_id").where(:follower_id => id)
        followee_id_array = Array.new(followships.count)
        followships.each_with_index do |element,index|
	        followee_id_array[index] = element.followee_id
        end
        Photo.where(:user_id => @followee_id_array)
	end

    def followers
        Followship.where(:followee_id => self.id)
    end

    def isFollowing(user_id)
        result = Followship.where(:followee_id => user_id, :follower_id => self.id)
        result.count != 0
    end
end

class User < ActiveRecord::Base
	has_many :albums
	has_many :photos

	scope :sorted, lambda { order("users.user_name ASC")}
end

class Photo < ActiveRecord::Base
    validates :image, presence: true

	belongs_to :user
	has_many :comments

	mount_uploader :image, ImageUploader
end

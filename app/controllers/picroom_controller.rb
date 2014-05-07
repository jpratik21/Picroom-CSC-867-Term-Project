class PicroomController < ApplicationController

	def welcome
	    reset_session
    	if session[:user_id] != nil 
    	  	redirect_to '/home'
        end
	end

	def error
	end

	def home
		@user = User.find(session[:user_id])
		@photos = @user.followingpictures.order("created_at DESC")
	end

	def search
		@user = User.find_by_id(session[:user_id])
		@searchcontent = params[:searchcontent]
	
		@photos1 = Photo.where(["description LIKE ?", "%#{@searchcontent}%"])
		@photos2 = Photo.where(:id => @photo_ids);

		@photos = @photos1 + @photos2

		@users = User.where(["user_name LIKE ?", "%#{@searchcontent}%"])
	end
end

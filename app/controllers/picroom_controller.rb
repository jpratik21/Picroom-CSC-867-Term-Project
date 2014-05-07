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
		@pictures = @user.followingpictures.order("created_at DESC")
	end
end

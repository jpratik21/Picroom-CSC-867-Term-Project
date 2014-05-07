class FollowshipsController < ApplicationController

  def create
		followship = Followship.new
		followship.follower_id = session[:user_id]
		followship.followee_id = params[:id]
		if followship.save
			redirect_to '/users/' + params[:id], notice: 'You have followed this user'
		end
	end

	def destroy
		followship = Followship.where(:follower_id => session[:user_id], :followee_id => params[:id])
		followship.destroy_all
		redirect_to '/users/' + params[:id], notice: 'You have unfollowed this user'
	end

	def followees
		follower_id = params[:id]
		@followships = Followship.where(:follower_id => params[:id])
		@follower = User.find_by_id(follower_id)
	end

	def followers
		followee_id = params[:id]
		@followships = Followship.where(:followee_id => @followee_id)
		@followee = User.find_by_id(followee_id)
	end
end

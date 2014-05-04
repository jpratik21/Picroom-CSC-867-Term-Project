class UsersController < ApplicationController
  
  layout false

  def index
    @users = User.sorted
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def delete
  end
end

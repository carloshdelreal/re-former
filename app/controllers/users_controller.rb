class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end
  
  def create
    #It uses the user_params method form the UsersHelper Module
    @user = User.new(user_params)

    if @user.save
      flash.notice = "User '#{@user.username}' Created!"
      redirect_to new_user_path
    else
      flash.notice = "User '#{@user.username}' Could not be Created"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  
  end

  def update
    @user = User.find(params[:id])
    

    if @user.update(user_params)
      flash.notice = "User '#{@user.username}' Updated!"
      redirect_to edit_user_path

    else
      flash.notice = "User '#{@user.username}' error"
      render :edit
    end
  end


  private 
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end

class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end
  
  def create
      @user = User.new(user_params)

      if @user.save
        redirect_to new_user_path
      else
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
end

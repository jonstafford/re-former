class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
    
  def create
    
    # This version is used by the 2nd generation form_tag form.
    #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
    # This version is used by the 1st generation simple HTML form and the
    # 3rd generation form_for form.
    @user = User.new(user_params)
    if @user.save
      flash.notice = "User '#{@user.username}' Created!"
      redirect_to new_user_path
    else
      render :new
    end
  end
  
  def update
    @user = User.find(params[:id])
 
    if @user.update(user_params)
      flash.notice = "User '#{@user.username}' Updated!"
      redirect_to edit_user_path(@user)
    else
      render :edit
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

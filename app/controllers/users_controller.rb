class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
    end
    redirect_to action: 'login'
  end

  def register
    @user = User.new
  end

  def list
    @users = User.all
  end

  def show
    @user = User.find(user_params)
  end

  def login
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to action: 'list'
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash.now[:notice] = "You signed up successfully"
      redirect_to '/login'
    else
      flash.now[:notice] = @user.errors.full_messages
      redirect_to action: 'register'
    end
  end

  def register
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(user_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to action: 'index'
  end

  private

  def user_params
    params.require(:user).permit(
      :username, :email, :password, :password_confirmation
    )
  end
end

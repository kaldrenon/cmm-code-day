class SessionsController < ApplicationController
  skip_before_action :require_user

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to '/tasks'
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    redirect_to '/login'
  end
end

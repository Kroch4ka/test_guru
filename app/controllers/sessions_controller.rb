class SessionsController < ApplicationController
  skip_before_action :check_authentication
  def new
    @user = User.new
  end
  def create
    email = params[:user][:email]
    password = params[:user][:password]

    authenticate_interactor = AuthenticateUser.call({ email: email, password: password })

    if authenticate_interactor.success?
      session[:user_id] = authenticate_interactor.user_id
      redirect_to root_path
    else
      redirect_to login_path, alert: authenticate_interactor.error
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end

class SessionsController < ApplicationController
  def new
    redirect_to @user if logged_in?
  end

  def create
    @user = User.find_by(email: session_params[:email])

    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user

    else
      redirect_to login_path, flash: {success: 'Invalid login credentials. Try again'}
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  def omniauth
    @user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid],
                                   provider: request.env['omniauth.auth'][:provider]) do |u|
      u.username = request.env['omniauth.auth'][:info][:first_name]
      u.email = request.env['omniauth.auth'][:info][:email]
      u.password = SecureRandom.hex(15)
    end
    session[:user_id] = @user.id
    redirect_to login_path
  end

  private

  def session_params
    params.permit(:email,:password)
  end
end

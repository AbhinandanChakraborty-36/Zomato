class UsersController < ApplicationController
  before_action :authorized, only: %i[show edit]

  def new
    if !logged_in?
      @user = User.new
    else
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      flash[:notice] = 'Cant create new user while logged in'
      redirect_to login_path
    end

    @user = User.new(user_params)

    if @user.valid?
      @user.save
      flash[:notice] = 'User Registered Successfully. Please Login to continue.'
      redirect_to login_path
    else
      flash[:notice] = 'Email already exists'
      redirect_to signup_path
    end
  end

  def show
    if !User.exists?(params[:id])
      flash[:notice] = 'User not authorized'
      redirect_to login_path
    else
      @user = User.find(params[:id])

      if session[:user_id] != @user.id
        flash[:notice] = 'Action not authorized'
        redirect_to login_path
      end
      @city = request.location.city
      @restaurants = Restaurant.all
    end
  end

  def edit
    if !User.exists?(params[:id])
      flash[:notice] = 'User not authorized'
      redirect_to login_path
    else
      @user = User.find(params[:id])
      if session[:user_id] != @user.id
        flash[:notice] = 'Not Authorized'
        redirect_to login_path
      end
    end
  end

  def update
    if !logged_in?
      redirect_to login_path

    else
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def appointments
    if !User.exists?(params[:id])
      flash[:notice] = 'User not authorized'
      redirect_to login_path
    else
      @user = User.find(params[:id])
      if session[:user_id] != @user.id
        flash[:notice] = 'Action not authorized'
        redirect_to login_path
      end
      @book = Book.where(user_id: current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :isadmin, :latitude,
                                 :longitude)
  end
end

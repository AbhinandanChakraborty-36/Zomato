class HomePageController < ApplicationController
  def new
    @user = (User.find(session[:user_id]) if logged_in?)
  end
end

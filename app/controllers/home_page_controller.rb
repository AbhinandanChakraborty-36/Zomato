class HomePageController < ApplicationController
  def new
    if logged_in?
      @user=User.find(session[:user_id])
    else
      @user=nil
    end
  end
end

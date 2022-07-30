class AdminPanelController < ApplicationController
  def index
    if logged_in? && current_user.isadmin
      @users = User.all
      @restaurants = Restaurant.all
    else
      redirect_to login_path
    end
  end

  def approval_panel
    @reviews = Review.where(isApproved: false) if logged_in? && current_user.isadmin
  end
end

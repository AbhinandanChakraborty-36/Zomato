class AdminPanelController < ApplicationController
    def index
        if logged_in? && current_user.isadmin
        @users=User.all
        @restaurants=Restaurant.all
        else
            redirect_to login_path
        end    
    end

    def approval_panel
        if logged_in? && current_user.isadmin
        @reviews=Review.where(isApproved: false)
        end
    end
end

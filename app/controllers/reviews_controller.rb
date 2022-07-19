class ReviewsController < ApplicationController

    def index
        @user= User.find(params[:user_id])        
        if session[:user_id]== @user.id 
        @user=User.find(current_user.id)
        else
            flash[:notice]= "Not Authorized"
            redirect_to login_path
        end   
    end

    def create
        @restaurant=Restaurant.find(params[:restaurant_id])
        @res=@restaurant.reviews.new(review_params)
        @res.user_id=current_user.id
        @res.save
        flash[:notice]="Review sent for approval from admin"
        redirect_to @restaurant
    end

    # Need edit and update actions
  
    def edit
        @review=Review.find(params[:id])
    end
    
    def update
        @review = Review.find(params[:id])

        if logged_in? && current_user.isadmin && @review.update(isApproved: true)
          redirect_to admin_approval_path
        elsif logged_in? && !current_user.isadmin && @review.update(review_params) && @review.update(isApproved: false)
            flash[:notice]="Update Sent for user approval"
            redirect_to user_path(current_user.id)
        else
          redirect_to login_path
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        @rest= Restaurant.find(@review.user_id)
        redirect_to @rest
      end

    
    def accept  
        @review= Review.find(params[:review_id])
        @review.update(isApproved: true)
        redirect_to admin_approval_path
    end    
    private
    def review_params
        params.require(:review).permit(:ratings, :stars)
    end
end

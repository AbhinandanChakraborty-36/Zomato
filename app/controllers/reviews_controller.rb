class ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if session[:user_id] == @user.id
      @user = User.find(current_user.id)
    else
      redirect_to login_path, flash: {success: 'Not Authorized'}
    end
  end

  def create
    @restaurant = Restaurant.find(get_restaurant[:restaurant_id])
    @res = @restaurant.reviews.new(create_review_params)
    @res.user_id = current_user.id
    @res.save
    redirect_to @restaurant, flash: {success: 'Review sent for approval from admin'}
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(get_review[:id])
    if logged_in? && current_user.isadmin && @review.update(review_params) && @review.update(isApproved: true)
      redirect_to user_path(current_user.id), flash: {success: 'Review Updated'}
    elsif logged_in? && !current_user.isadmin && @review.update(review_params) && @review.update(isApproved: false)
      redirect_to user_path(current_user.id), flash: {success: 'Edited review sent for admin approval'}
    else
      redirect_to login_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurants_path
  end

  def accept
    @review = Review.find(params[:review_id])
    @review.update(isApproved: true)
    redirect_to admin_approval_path
  end

  private

  def review_params
    params.require(:review).permit(:ratings, :stars)
  end

  def create_review_params
    params.permit(:ratings, :stars)
  end

  def get_restaurant
    params.permit(:restaurant_id)
  end

  def get_review
    params.permit(:id)
  end

end
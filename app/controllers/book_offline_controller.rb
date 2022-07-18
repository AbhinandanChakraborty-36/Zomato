class BookOfflineController < ApplicationController
  def index
  end
  
  def new
   @book= Book.new
  end

  def create
    @book=Book.new(user_id:current_user.id, restaurant_id: params[:id], booked_at:params[:booked_at],booked_on:params[:booked_on], head:params[:heads])
    @book.save
    flash[:notice]="Booking Confirmed"
    redirect_to login_path
  end

end

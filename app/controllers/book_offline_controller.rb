class BookOfflineController < ApplicationController
  def index; end

  def new
    @book = Book.new if logged_in?
  end

  def create
    @book = Book.new(book_offline_params)
    @book.save
    redirect_to login_path, flash: {success: 'Booking Confirmed'}
  end

  private 

  def book_offline_params
    params.permit(:id,:booked_at,:booked_on,:head)
  end
end

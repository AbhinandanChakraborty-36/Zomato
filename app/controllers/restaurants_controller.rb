class RestaurantsController < ApplicationController
  def index
    if logged_in?
      @restaurants = Restaurant.all
    else
      redirect_to login_path
    end
  end

  def show
    if logged_in?
      @restaurant = Restaurant.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def new
    if logged_in? && current_user.isadmin?
      @restaurant = Restaurant.new
    else
      redirect_to login_path, flash: {success: 'Only admin can register new restaurants'}
    end
  end

  def create
    @restaurant = Restaurant.create(params_create)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if logged_in? && current_user.isadmin?
      @restaurant = Restaurant.find(params[:id])
    else
      redirect_to login_path, flash: {success: 'Only admin can update restaurants'}
    end
  end

  def update
    @restaurant = Restaurant.find(get_restaurant[:id])
    if params[:restaurant][:pictures].present?
      params[:restaurant][:pictures].each do |image|
        @restaurant.pictures.attach(image)
      end
    end
    if @restaurant.update(resturant_params)
      redirect_to @restaurant
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  def search
    unless logged_in?
      redirect_to login_path, flash: {success: 'Please Signup/Login'}
    end
    @searched_item = search_params[:search]
    @restaurants1 = Restaurant.search_name(@searched_item)
    @restaurants2 = Restaurant.near(@searched_item, 50).order('distance')
    @restaurants3 = Restaurant.search_type(@searched_item)
    @restaurants = @restaurants1 | @restaurants2 | @restaurants3
  end

  def search_filter
    @search = search_params[:search]
    @filter = search_params[:filter]
    @restaurants = if @filter == 'Restaurant'
                     Restaurant.search_name(@search)
                   elsif @filter == 'Location'
                     Restaurant.near(@search, 50).order('distance')
                   else
                     Restaurant.search_type(@search)
                   end

    render :search_filter, locals: { search: search_params[:search], filter: search_params[:filter] }
  end

  private

  def resturant_params
    params.require(:restaurant).permit(:name, :category, :resturant_type, :pictures)
  end

  def get_restaurant
    params.permit(:id)
  end

  def search_params
    params.permit(:search, :filter)
  end
end

class OrdsController < ApplicationController
  
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu_arr = params[:accept]
    @quantity_arr = params[:quantity]
    @q = @quantity_arr.delete('')
    @test = @menu_arr[0].to_i
    @test -= 1
    @total = 0
  end

  def create
    @menus = order_params[:menu_arr].split(' ')
    @restaurant_id = order_params[:restaurant_id]
    @quantity_arr = order_params[:quantity_arr].split(' ')
    @add = order_params[:street] + ',' + order_params[:city] + '-' + order_params[:pincode]
    @order = Ord.new(user_id: current_user.id, restaurant_id: @restaurant_id, Address: @add)
    @order.save
    @menus.each_with_index do |menu, index|
      @order.ord_items.create(menu: menu, quantity: @quantity_arr[index])
    end
    redirect_to gmapps_path
  end

  private

  def order_params
    params.permit(:menu_arr,:restaurant_id,:quantity_arr,:street,:city, :pincode)
  end
end

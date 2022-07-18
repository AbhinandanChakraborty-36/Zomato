class OrdersController < ApplicationController

    def index
        @restaurant= Restaurant.find(params[:restaurant_id])
        @menu_arr=params[:accept]
        @quantity_arr=params[:quantity]
        @test= @menu_arr[0].to_i
        @test=@test-1
        @total=0
    end

    def create
        @menus= params[:menu_arr].split(' ')
        @restaurant_id=params[:restaurant_id]
        @quantity_arr= params[:quantity_arr].split(' ')
        @order=Order.new(User_id:current_user.id, Restaurant_id:@restaurant_id)
        @order.save
        @menus.each do |menu|
         @order.ordered_items.create(menu: menu, quantity: @quantity_arr[menu.to_i - 1])
        end   
        redirect_to gmapps_path
    end


    def show
        

    end
end

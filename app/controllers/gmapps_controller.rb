class GmappsController < ApplicationController
    def index
        @user=current_user
        @order= Ord.where(user_id:@user.id).last
        if !@order.nil?
        @restaurant=Restaurant.find(@order.restaurant_id)
        @ordered_items= @order.ord_items.all

        else
            flash[:notice]="No orders currently"
            redirect_to login_path
        end
        @total_cost=0
    end
end

class MenusController < ApplicationController
    def index
        @restaurant=Restaurant.find(params[:restaurant_id])
    end
end

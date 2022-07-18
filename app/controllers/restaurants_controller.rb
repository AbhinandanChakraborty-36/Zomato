class RestaurantsController < ApplicationController

    def index
      if logged_in?
        @restaurant=Restaurant.all
      else
        redirect_to login_path
      end    
    end

    def show
        if logged_in?
        @restaurant=Restaurant.find(params[:id])
        else
        redirect_to login_path
        end  
    end

    def new
      if logged_in? && current_user.isadmin?
        @restaurant=Restaurant.new
      else
        flash[:new]="Only admin can register new restaurants"  
        redirect_to login_path
      end 
    end

    def create
        @restaurant=Restaurant.create(params_create)
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
          flash[:new]="Only admin can register new restaurants"  
           redirect_to login_path
        end
    end
      def update
        @restaurant = Restaurant.find(params[:id])
        
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
           
        if !logged_in?
          flash[:notice]="Please Signup/Login"
          redirect_to login_path
        end
        
         @restaurants1= Restaurant.where("name LIKE ?", "%"+params[:search]+"%")
         @restaurants2= Restaurant.near(params[:search],50).order("distance")
      end
    
    private

    def params_create
        params.require(:restaurant).permit(:name,:category,:resturant_type,:latitude,:longitude,pictures: [])
    end

    def resturant_params
        params.require(:restaurant).permit(:name,:category,:resturant_type)
    end
end

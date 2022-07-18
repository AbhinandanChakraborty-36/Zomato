class SessionsController < ApplicationController
    def new
        if logged_in?
            redirect_to @user
        end
    end

    def create
        @user=User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id]=@user.id
            redirect_to @user

        else
            redirect_to login_path
            flash[:error]="Invalid login credentials. Try again"
        end
    end

    def destroy
        session[:user_id] =nil
        redirect_to login_path
    end

    def omniauth
        @user=User.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider:request.env['omniauth.auth'][:provider]) do |u|
            u.username=request.env['omniauth.auth'][:info][:first_name]
            u.email=request.env['omniauth.auth'][:info][:email]
            u.password= SecureRandom.hex(15)
        end
        # binding.pry
        # if @user.valid?
        #     session[:user_id]=@user.id
        #     redirect_to @user
        # else 
                # redirect_to login_path
        # end
        session[:user_id]=@user.id
        redirect_to login_path
    end
end

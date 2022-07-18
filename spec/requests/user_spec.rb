require 'rails_helper'

RSpec.describe "Users", type: :request do

  
  describe "GET /show" do
    it "User not authenticated" do 
      create(:user)
      get "/users/1"
      expect(response).to have_http_status(302)  
    end

    
    it "User authenticated" do 
      user=FactoryBot.create(:user,email:"check@gmail.com",password:"Abhi",password_confirmation:"Abhi")
      post sessions_url, params:{email: user.email, password: user.password}
      
      get "/users/1"
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /edit" do
    it "User not authenticated" do 
      user=create(:user)
      get "/users/1/edit"
      expect(response).to have_http_status(302)  
    end
    it "User authenticated" do 
      user=create(:user)
      post sessions_url, params: { email: user.email, password: user.password}
      get "/users/"+user.id.to_s+"/edit"
      expect(response).to have_http_status(200)  
    end
  end  

  describe "GET /new" do
    it "User not authenticated" do 
      get "/users/new"
      expect(response).to have_http_status(200)  
    end
    it "User authenticated" do 
      user=create(:user)
      post sessions_url, params: { email: user.email, password:user.password}
      get "/users/new"
      expect(response).to have_http_status(302)  
    end

  end 

  describe "Patch /update" do
    it "User not authenticated" do 
      user=create(:user)
      patch '/users/'+user.id.to_s, params:{user:{username:"Changed Name", password:"Abhi",password_confirmation:"Abhi"}}
      expect(response).to have_http_status(302)  
    end
    it "User authenticated" do 
      user=create(:user)
      post sessions_url, params: { email: user.email, password: user.password}
      patch '/users/'+user.id.to_s, params:{user:{username:"Changed Name", password:"Abhi",password_confirmation:"Abhi"}}
      expect(response).to redirect_to(user_path(user)) 
    end
  end 

  describe "User Reviews" do
    it "Check Reviews" do
      user=create(:user)
      restaurant= create(:restaurant)
      review= create(:review, user: user, restaurant: restaurant, ratings:"Testing ratings")
      post sessions_url, params: { email: user.email, password: user.password}
      get '/users/'+user.id.to_s+'/reviews'
      expect(response).to have_http_status(200)  
    end
  end


  describe "User Bookings" do
    it "User Bookings" do
      user=create(:user, email:"asasas@gmail.com")
      restaurant= create(:restaurant)
      book= create(:book, user: user, restaurant: restaurant)
      post sessions_url, params: { email: user.email, password: user.password}
      get '/user/'+user.id.to_s+'/bookings'
      expect(response).to have_http_status(200)
    end
  end   
end



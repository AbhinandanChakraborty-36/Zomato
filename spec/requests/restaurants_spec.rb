require 'rails_helper'

RSpec.describe 'Restaurants', type: :request do
  describe 'GET /restaurants' do
    it 'without signing in' do
      get restaurants_path
      expect(response).to have_http_status(302)
    end
    it 'After Authentication' do
      user = create(:user)
      post sessions_url, params: { email: user.email, password: user.password }
      get restaurants_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show restaurants' do
    it 'without signing in' do
      restaurant = create(:restaurant)
      get '/restaurants/' + restaurant.id.to_s
      expect(response).to have_http_status(302)
    end

    it 'After Authentication' do
      user = FactoryBot.create(:user, email: 'check@gmail.com', password: 'Abhi', password_confirmation: 'Abhi')
      post sessions_url, params: { email: user.email, password: user.password }

      get '/users/1'
      expect(response).to have_http_status(200)
      restaurant = create(:restaurant)
      get '/restaurants/' + restaurant.id.to_s
      expect(response).to have_http_status(200)
    end
  end
  describe 'GET /new restaurants' do
    it 'without signing in' do
      get '/restaurants/new'
      expect(response).to have_http_status(302)
    end
    it 'without signing in as admin' do
      user = FactoryBot.create(:user, email: 'check@gmail.com', password: 'Abhi', password_confirmation: 'Abhi')
      post sessions_url, params: { email: user.email, password: user.password }
      get '/restaurants/new'
      expect(response).to have_http_status(302)
    end
    it 'Signing in as admin' do
      user = FactoryBot.create(:user, email: 'check@gmail.com', password: 'Abhi', password_confirmation: 'Abhi',
                                      isadmin: true)
      post sessions_url, params: { email: user.email, password: user.password }
      get '/restaurants/new'
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /edit restaurants' do
    it 'without signing in' do
      restaurant = create(:restaurant)
      get '/restaurants/' + restaurant.id.to_s + '/edit'
      expect(response).to have_http_status(302)
    end

    it 'without signing in as admin' do
      user = FactoryBot.create(:user, email: 'check@gmail.com', password: 'Abhi', password_confirmation: 'Abhi')
      post sessions_url, params: { email: user.email, password: user.password }
      restaurant = create(:restaurant)
      get '/restaurants/' + restaurant.id.to_s + '/edit'
      expect(response).to have_http_status(302)
    end

    it 'Signing in as admin' do
      user = FactoryBot.create(:user, email: 'check@gmail.com', password: 'Abhi', password_confirmation: 'Abhi',
                                      isadmin: true)
      post sessions_url, params: { email: user.email, password: user.password }
      restaurant = create(:restaurant)
      get '/restaurants/' + restaurant.id.to_s + '/edit'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create restaurants' do
    it 'create a restaurant' do
      post '/restaurants', params: { restaurant: { name: 'Test Hotel', category: 'Test', resturant_type: 'Test' } }
      expect(response).to have_http_status(302)
    end
  end

  describe 'PATCH /update restaurant information' do
    it 'update restaurant information' do
      restaurant = create(:restaurant)
      patch '/restaurants/' + restaurant.id.to_s,
            params: { restaurant: { name: 'Updated name', category: 'Updated', resturant_type: 'Updated' } }
      expect(response).to have_http_status(302)
    end
  end

  describe 'Delete /delete restaurant' do
    it 'delete restaurant ' do
      restaurant = create(:restaurant)
      delete '/restaurants/' + restaurant.id.to_s
      expect(response).to have_http_status(303)
    end
  end

  describe 'Search' do
    it 'without authentication' do
      restaurant1 = create(:restaurant)
      restaurant2 = create(:restaurant, name: 'restaurant 2')
      get '/search', params: { search: 'Rest' }
      expect(response).to have_http_status(302)
    end

    it 'Signed in user' do
      user = create(:user)
      post sessions_url, params: { email: user.email, password: user.password }
      restaurant1 = create(:restaurant)
      restaurant2 = create(:restaurant, name: 'restaurant 2')
      get '/search', params: { search: 'Rest' }
      expect(response).to have_http_status(200)
      get '/search', params: { search: '2' }
      expect(response).to have_http_status(200)
      get '/search', params: { search: 'Kolkata' }
      expect(response).to have_http_status(200)
    end
  end
end

Rails.application.routes.draw do
  
  resources :ords do 
    resources :ord_items
  end

  resources :gmapps
 

  # get 'book_offline/index'
  # resources :orders do
  #   resources :ordered_items
  # end
 
  resources :restaurants do
    resources :reviews
    resources :book_offline
    resources :menus
  end
    
  resources :users do
    resources :reviews 
    resources :ords
  end
  resources :reviews

  # get 'home_page/new'
  resources :users, only:[:create, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home_page#new"
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/admin', to: 'admin_panel#index'
  get '/admin/approval', to: 'admin_panel#approval_panel',as:'admin_approval'
  # post '/approved', to: 'reviews#approved', as:"approved"
  # post '/declined', to: 'reviews#declined', as:"declined"
  post '/reviews/:id/edit', to: 'reviews#update'
  get '/user/:id/reviews/check', to: 'reviews#check'
  post '/restaurants/:id/book_offline/new', to: 'book_offline#create'
  get '/user/:id/bookings', to: 'users#appointments', as:'appointments'
  get '/orders/gmpass', to:'orders#gmapss'
  get '/search',to: 'restaurants#search'
end

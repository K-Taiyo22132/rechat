Rails.application.routes.draw do


  resources :categories
  resources :select_categories
  get 'groups/index'
  root to: 'groups#index'
  resources :groups
  resources :occupations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
  get '/image_of_users/:id',to: 'users#send_image',as: 'image_of_users'
  
  get '/image_of_categories/:id', to: 'categories#send_image', as: 'image_of_categories'

  get '/image_of_store_reviews/:id', to: 'store_reviews#send_image', as: 'image_of_store_reviews'
  
  get'/image_of_groups/:id',to: 'groups#send_image', as: 'image_of_groups'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  
  resources :users
end
  

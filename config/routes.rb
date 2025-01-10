Rails.application.routes.draw do


  resources :follows
  resources :group_reviews
  resources :select_reviews
  resources :review_homes
  resources :store_comments
  resources :goods_comments
  resources :categories
  resources :messages
  resources :select_categories
  get 'chats/index'
  get 'users/profile'
  root to: 'chats#index'
  resources :groups
  resources :chats
  resources :occupations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
  get '/image_of_users/:id',to: 'users#send_image',as: 'image_of_users'
  get '/image_of_categories/:id', to: 'categories#send_image', as: 'image_of_categories'
  get '/image_of_goods_reviews/:id', to: 'goods_reviews#send_image', as: 'image_of_goods_reviews'
  get '/image_of_store_reviews/:id', to: 'store_reviews#send_image', as: 'image_of_store_reviews'

  delete 'followed_user/:id', to: 'follows#destroy', as: 'followunsubscribe'

  get'/image_of_groups/:id',to: 'groups#send_image', as: 'image_of_groups'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  
  resources :users
  resources :chats
  resources :store_reviews
  resources :store_comments
  resources :goods_reviews
end
  

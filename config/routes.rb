Rails.application.routes.draw do
  resources :categories
  resources :select_categories
  resources :groups
  resources :occupations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'profile'
  delete '/users/:id', to: 'users#destroy', as: 'unsubscribe'
<<<<<<< HEAD

  get '/image_of_categories/:id', to: 'categories#send_image', as: 'image_of_categories'

=======
# <<<<<<< HEAD

  get '/image_of_categories/:id', to: 'categories#send_image', as: 'image_of_categories'

# =======
>>>>>>> 85f29aa65be804176e82bf6ac1ae7be4b8587df1
  get'/image_of_groups/:id',to: 'groups#send_image', as: 'image_of_groups'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
<<<<<<< HEAD
=======
# <<<<<<< HEAD
  
# =======
# >>>>>>> 6d2642ec21d6cd726337e05ef6d45fc049298ce9
# >>>>>>> b14de08cbb4880e9fa2ec4bbed57ac09f08f9d62
>>>>>>> 85f29aa65be804176e82bf6ac1ae7be4b8587df1
end
  

Rails.application.routes.draw do
  resources :select_categories
  resources :groups
  resources :occupations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

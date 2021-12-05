
Rails.application.routes.draw do
  get 'categories/index'
  
  resources :categories

  root 'categories#index'
end
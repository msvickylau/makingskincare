Rails.application.routes.draw do
  devise_for :users
  resources :formulas
  resources :skinconcerns, only: [:show, :index]
  resources :categories, only: [:show, :index]

  root "formulas#index"
  
end

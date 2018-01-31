Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :formulas
  resources :skinconcerns, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :users, only: [:show]

  root "formulas#index"
  
end

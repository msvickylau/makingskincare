Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :skinconcerns, only: [:show, :index]
  resources :categories, only: [:show, :index]

  resources :users, only: [:show] do
    resources :formulas, only: [:show, :index]
  end

  resources :formulas, only: [:index, :show, :new, :create, :edit, :update]

  root "home#index"
  
end

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :skinconcerns, only: [:show, :index]
  resources :categories, only: [:show, :index]

  resources :users, only: [:show] do
    resources :formulas
  end

  resources :formulas do
    resources :comments
  end

  root "home#index"

  get '/skinconcerns/:id/next', to: 'skinconcerns#next_skinconcern'
  get '/skinconcerns/:id/previous', to: 'skinconcerns#previous_skinconcern'
  
end



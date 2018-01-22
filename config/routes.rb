Rails.application.routes.draw do
  devise_for :users
  resources :formulas

  root "formulas#index"
  
end

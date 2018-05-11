Rails.application.routes.draw do
  devise_for :accounts

  resources :accounts, only: %i[index show edit update destroy]
  resources :vendors
  resources :customers
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

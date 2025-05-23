Rails.application.routes.draw do

  devise_for :users
  
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :index, :update]
  
  root to: "home#top"

  get 'home/about', to: 'home#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

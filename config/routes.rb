Rails.application.routes.draw do

  root 'home#index'

  get 'home', to: 'home#index'
  get 'search', to: 'search#books'

  devise_for :users

  resources :books
  resource :shelf, only: :show
  resources :lists, except: [:edit, :index]
  resource :statistics, only: [:show]
  resources :editors
  resources :authors
end

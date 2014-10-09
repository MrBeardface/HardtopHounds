Rails.application.routes.draw do

  root to: 'staticpages#home'
  devise_for :users

  get '/help', to: 'staticpages#help'
  get '/about', to: 'staticpages#contact'

  get '/users/:id', to: 'users#show', as: :user
  resources :projects
  resources :blogs
  resources :forums, only: [:new, :create, :show, :index]
  resources :topics, only: [:new, :edit, :show, :create, :destroy, :index]
end

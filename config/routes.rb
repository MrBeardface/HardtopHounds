Rails.application.routes.draw do

  root to: 'staticpages#home'
  devise_for :users

  get '/help', to: 'staticpages#help'
  get '/about', to: 'staticpages#contact'

  get '/users/:id', to: 'users#show', as: :user
  post '/projects/add_journal', to: 'projects#add_journal'
  delete '/projects/remove_journal', to: 'projects#remove_journal'

  resources :projects
  resources :blogs
  resources :forums, only: [:new, :create, :show, :index]
  resources :topics, only: [:new, :edit, :show, :create, :destroy, :index]

  # post '/favorites', to: 'favorites#create_favorite_project'
  # delete '/favorites/:id', to: 'favorites#destroy_favorite_project', as: :favorite 
  resources :favorite_projects, only: [:create, :destroy]
  resources :favorite_blogs, only: [:create, :destroy]
  resources :favorite_topics, only: [:create, :destroy]
end

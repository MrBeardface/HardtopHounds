Rails.application.routes.draw do

  root to: 'staticpages#home'
  devise_for :users

  get '/help', to: 'staticpages#help'
  get '/about', to: 'staticpages#contact'

  get '/users/:id', to: 'users#show', as: :user

end

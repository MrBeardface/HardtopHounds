Rails.application.routes.draw do

  devise_for :users
  root to: 'staticpages#home'

  get '/help', to: "staticpages#help"
  get '/about', to: "staticpages#contact"

end

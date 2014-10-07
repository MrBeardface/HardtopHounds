Rails.application.routes.draw do

  root to: 'staticpages#home'

  get '/help', to: "staticpages#help"
  get '/about', to: "staticpages#contact"

end

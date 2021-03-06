Rails.application.routes.draw do
  post '/users/signin', to: 'users#signin'
  post '/users/signup', to: 'users#signup'
  get '/barbers/index', to: 'barbers#index'
  get '/barbers/show/:id', to: 'barbers#show'
  post '/appointments/add', to: 'appointments#add'
  get '/appointments/show/:id', to: 'appointments#show'
end

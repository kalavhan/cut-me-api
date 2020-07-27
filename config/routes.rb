Rails.application.routes.draw do
  post '/users/signin', to: 'users#signin'
  post '/users/signup', to: 'users#signup'
  get '/barbers/index', to: 'barbers#index'
  get '/barbers/show', to: 'barbers#show'
end

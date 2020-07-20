Rails.application.routes.draw do
  post '/users/signin', to: 'users#signin'
  post '/users/signup', to: 'users#signup'
end

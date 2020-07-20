Rails.application.routes.draw do
  get '/users/:email/:pwd', to: 'users#signin'
  post '/users', to: 'users#signup'
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/users/sign-up', to: 'users#signup'
  post '/users/sign-in', to: 'users#signin'

  post '/todos', to: 'todos#create'
  get '/todos', to: 'todos#index'

end

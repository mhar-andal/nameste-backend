Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
    post '/users', to: 'users#create'
    post '/sessions', to: 'sessions#create'
    delete '/sessions', to: 'sessions#destroy'
  end
end

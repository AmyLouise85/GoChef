Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users do 
    resources :photos
    resources :skills
  end

  root to: 'users#index'

  post '/users/:id', to: 'reviews#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

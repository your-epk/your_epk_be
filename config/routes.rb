Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create, :index]
      resources :movie_details, only: [:create, :index], path: '/movie-details'
    end
  end
end

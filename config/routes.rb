Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :film_epk, only: [:create, :index, :update, :destroy, :show]
      resources :users, only: [:show]
      resources :awards, only: [:create, :destroy]
      resources :movie_posters, only: [:create]
      resources :head_shots, only: [:create]
      resources :film_fams, only: [:create, :destroy, :update]
      resources :header_images, only: [:create]
      resources :presses, only: [:create, :destroy]
      post '/presigned_url', to: 'direct_upload#create'
    end
  end
end

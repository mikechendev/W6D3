Rails.application.routes.draw do
  resources :artworks, only: [:show, :create, :destroy, :update]
  # get 'artwork_shares/create'
  # get 'artwork_shares/destroy'
  # get 'artworks/index'
  # get 'artworks/create'
  # get 'artworks/show'
  # get 'artworks/destroy'
  # get 'artworks/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show, :create, :destroy, :update]
  resources :users do
    resources :artworks, only: [:index]
  end
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user'
  # get 'users/new', to: 'users#new'
  # post 'users', to: 'users#create'
  # get 'users/:id/edit', to: 'users#edit'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'
  resources :artwork_shares, only: [:create, :destroy]
end

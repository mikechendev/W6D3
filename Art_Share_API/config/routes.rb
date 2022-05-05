Rails.application.routes.draw do
 
  resources :artworks, only: [:show, :create, :destroy, :update]
  resources :artworks do
    resources :comments, only: [:index, :create, :destroy]
  end
  resources :users, only: [:index, :show, :create, :destroy, :update]
  resources :users do
    resources :likes, only: [:index, :create, :destroy]
    resources :artworks, only: [:index]
    resources :comments, only: [:index, :create, :destroy]
    get :favorite_artworks
    get :favorite_shared_artworks
  end
  
  resources :artwork_shares, only: [:create, :destroy]
end

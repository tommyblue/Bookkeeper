Bookkeeper::Engine.routes.draw do
  resources :purchases
  resources :search, only: [:create]
  resources :balance, only: [:index]
  resources :movements
end

Bookkeeper::Engine.routes.draw do
  resources :purchases
  resources :search, only: [:create]
end

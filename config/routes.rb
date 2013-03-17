Bookkeeper::Engine.routes.draw do
  resources :purchases
  resources :search, only: [:create]
  resources :balance, only: [:index]
  resources :movements, only: [:destroy]
  resources :incomings, except: [:index, :show, :destroy]
  resources :outgoings, except: [:index, :show, :destroy]
end

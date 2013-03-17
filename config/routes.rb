Bookkeeper::Engine.routes.draw do
  resources :purchases
  resources :search, only: [:create]
  resources :balance, only: [:index]
  resources :incomings, except: [:index, :show]
  resources :outgoings, except: [:index, :show]
end

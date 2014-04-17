Betastore::Application.routes.draw do


  resources :subscriptions
  resources :customers



  namespace :admin do
    resources :products
   # get '/products'     => 'products#index', as: 'products'
   # get '/products/new' => 'products#new', as: 'new_product'
   # get '/products/:id' => 'products#show', as: 'product'
   # post '/products' => 'products#create'
   get  '/login' => 'login#new', as: 'logins'
   post '/login' => 'login#create'

  end

  get '/products' => 'products#index'
  root :to => 'subscriptions#new'
end
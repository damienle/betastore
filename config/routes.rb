Betastore::Application.routes.draw do






  resources :subscriptions
  resources :customers

  get  '/sign_up' => 'customers#new', as: 'sign_up'
# when email user and they click confirm then
  get  '/verify/:token' => 'customers#check', as: 'check_customer'
  get '/fail' => 'fail#fail'
# get '/sign_up' => 'customers#new', as: 'sign_up_path'

  namespace :admin do
    resources :products
   # get '/products'     => 'products#index', as: 'products'
   # get '/products/new' => 'products#new', as: 'new_product'
   # get '/products/:id' => 'products#show', as: 'product'
   # post '/products' => 'products#create'
   get  '/login' => 'logins#new', as: 'logins'
   post '/login' => 'logins#create'

  end
  get '/login' => 'logins#new', as: 'logins'
  post '/login' => 'logins#create'
  get '/logout' => 'logins#destroy', as: 'logout'

  get '/products' => 'products#index', as: 'products'
  root :to => 'subscriptions#new'
end
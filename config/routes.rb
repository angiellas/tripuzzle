Rails.application.routes.draw do

  
match '/contacts',     to: 'contacts#new',             via: 'get'
resources "contacts", only: [:new, :create]


resources :categories
 get 'orderitems/index'
 get 'orderitems/show'
 get 'orderitems/new'
 get 'orderitems/edit'
 
 resources :orders do 
    resources:orderitems
  end
# resources:categories
  
  devise_for :users do
    resources:orders
  end
  
  get '/checkout', to: 'cart#createOrder'
  
  get '/paid', to: 'static_pages#paid'
  
  
  get 'cart/index'
  
  get 'category/:title', to: 'static_pages#category'


resources :items
root 'static_pages#home'

  get '/home', to: 'static_pages#home'

  get '/about', to: 'static_pages#about'
  
  get '/contact', to: 'static_pages#contact'
  
  get '/login', to: 'user#login'
  
  #get '/admin_login', to: 'user#admin_login'
  
  get '/logout', to: 'user#logout'

  get '/aboutSend', to: 'static_pages#aboutSend'

get '/cart/clearCart', to: 'cart#clearCart'
get '/cart', to: 'cart#index'
get '/cart/:id', to: 'cart#add'
get 'cart/remove/:id', to: 'cart#remove'

post '/search' => 'items#search'

root :to => 'site#home'
  
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

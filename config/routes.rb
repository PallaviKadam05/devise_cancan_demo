Rails.application.routes.draw do
  resources :stores
  #devise_for :users
#    devise_for :users
#   scope "/admin" do
#   resources :users
# end
#   resources :items
#   #resources :users
#   resources :roles

#   root to: "items#index"
  
#  authenticated :user do
#    root :to => 'items#index', as: :authenticated_root
#  end
#    root :to => 'welcomes/new'
 
devise_for :users
  scope "/admin" do
    resources :users
  end

  resources :items

  resources :roles

  authenticated :user do
    root :to => 'items#index', as: :authenticated_root
  end
root :to => 'welcomes#new'

# root "/welcomes/new",  to: "welcomes#new"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

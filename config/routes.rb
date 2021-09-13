Rails.application.routes.draw do
  
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :confirmations => 'users/confirmations',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    root :to => "users/sessions#new"
    get "signup", :to => "users/registrations#new"
    get "verify", to: "users/registrations#verify"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  
  #get 'products/index'
  #get 'products/show'
  #get 'products/new'
  #get 'products/edit'
  #get 'products/create'
  #get 'products/update'
  #get 'products/destroy'
  resources :products  do
    member do
      get 'favorite'
    end
  end

  post "reviews/:id/create", to: "reviews#create", as: :reviews
  
  #post "review/:id/create", to: "reviews#create", as: :review_create
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

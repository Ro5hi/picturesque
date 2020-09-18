Rails.application.routes.draw do

  root 'users#index'  

  resources :posts
  resources :tags
  resources :comments, only: [:new, :create]

  resources :users do 
    resources :posts, only: [:new, :show, :create]
  end 

  get '/tag/:name' => "tags#show"
  get '/:username/posts/:id' => "posts#show"
  get '/profile/:username' => "users#show", as: :profile
  
  devise_for :users, controllers:{omniauth_callbacks: "omniauth_callbacks"}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/auth/twitter' => 'devise/omniauth_callbacks#passthru'
    get '/auth/twitter/callback' => 'omniauth_callbacks#twitter'
  end 
end 
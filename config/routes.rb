Rails.application.routes.draw do

  root 'users#index'  

  devise_for :users, controllers:{omniauth_callbacks: "omniauth_callbacks"}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/auth/twitter' => 'devise/omniauth_callbacks#passthru'
    get '/auth/twitter/callback' => 'omniauth_callbacks#twitter'
  end

  resources :users, only: [:index, :show] do
    resources :posts
  end
  get '/profile/:username' => "users#show", as: :profile 
  get '/:username/posts/:id' => "posts#show"
  
  resources :posts, shallow: true do 
    resources :comments
  end 

  resources :tags, only: [:index, :show]
  get '/tag/:name' => "tags#show"
  
end
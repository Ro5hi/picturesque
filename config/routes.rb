Rails.application.routes.draw do

  root 'users#index'  

  resources :tags, only: [:index, :show]

  resources :users do 
    resources :posts
  end

  resources :posts, shallow: true do 
    resources :comments
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
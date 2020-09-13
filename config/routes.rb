Rails.application.routes.draw do

  root 'users#index'  

  resources :posts, only: [:index, :new, :show, :update, :edit, :create, :destroy]
  resources :comments, only: [:new, :create, :show, :destroy]

  get '/feed' => "posts#index"
  get 'profile/:username' => "users#show", as: :profile
  get '/edit/post/:id' => "post#update"
  get '/post/:id' => "post#show"

  devise_for :users, controllers:{omniauth_callbacks: "omniauth_callbacks"}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/auth/twitter' => 'devise/omniauth_callbacks#passthru'
    get '/auth/twitter/callback' => 'omniauth_callbacks#twitter'
  end 
end 
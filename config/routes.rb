Rails.application.routes.draw do

  root 'users#index'

  resources :posts, only: [:index, :new, :show, :create]

  get '/feed' => "posts#index"

  devise_for :users, controllers:{omniauth_callbacks: "omniauth_callbacks"}
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
    get '/auth/twitter' => 'devise/omniauth_callbacks#passthru'
    get '/auth/twitter/callback' => 'omniauth_callbacks#twitter'
  end
end 
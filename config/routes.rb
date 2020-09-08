Rails.application.routes.draw do

  root 'users#index'

  resources :posts, only: [:index, :new, :show, :create]

  get '/feed' => "posts#index"
  get '/auth/twitter/callback' => 'sessions#create'

  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end 
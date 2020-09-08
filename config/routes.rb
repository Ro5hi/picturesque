Rails.application.routes.draw do

  root 'users#index'

  resources :posts, only: [:index, :new, :show, :create]

  get '/feed' => "posts#index"

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end 
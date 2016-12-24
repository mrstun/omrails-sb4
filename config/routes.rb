Rails.application.routes.draw do
  get 'users/:username', to: 'users#show', as: 'user'

  resources :user, only: :show, param: :username do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
    end
  end
  resources :clues
  resources :tweets
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get "signin" => 'devise/sessions#new'
  	delete "signout" => 'devise/sessions#destroy'
  	get 'signup' => 'devise/registrations#new'
  end
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contactus' => 'pages#contactus'
  get 'clues' => 'pages#clues'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

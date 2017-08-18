Rails.application.routes.draw do
  devise_for :users 

  resources :wikis

  get 'users/show'

  resources :users, only: [:show, :index] do
    post 'publicize_wiki' => 'users#publicize_wiki', as: :publicize_wiki
    end

  resources :charges, only: [:new, :create]

  get 'welcome/index'
	root to: "welcome#index"
end

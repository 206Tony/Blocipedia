Rails.application.routes.draw do
  resources :wikis
	devise_for :users

  get 'users/upgrade'

  resources :users do
    collection do
      get "upgrade"
    end
  
    post "change_role"
    post 'to_standard'
  end

  resources :charges, only: [:new, :create]

  get 'welcome/index'
	root to: "welcome#index"
end

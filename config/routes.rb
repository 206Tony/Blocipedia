Rails.application.routes.draw do
  
	devise_for :user, controllers: { sessions: 'user/sessions' }
  resources :wikis

  resources :users, only: [] do
    resources :wikis
  end
  
  # authenticated :user do
  #   root 'wikis#index', as: :authenticated
  # end

  resources :charges, only: [:new, :create]
  get '/charges/downgrade' => 'charges#downgrade', as: :downgrade
  post '/to_standard' => 'charges#to_standard', as: :to_standard


  get 'about' => 'welcome#about'
	root to: "welcome#index"
end

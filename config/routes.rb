Rails.application.routes.draw do
  devise_for :user, controllers: { sessions: 'users/sessions'}
  get 'welcome/index'

  get 'welcome/about'

  root "welcome#index"
end

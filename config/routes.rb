Rails.application.routes.draw do
  namespace :admin do
    resources :teams
  end
  devise_for :leaders, only: [ :sessions, :passwords ]
  
  namespace :admin do
    resources :contestants
    resources :teams
  end

  get 'admin', to: 'admin/teams#new'

  root to: "admins#index"
end

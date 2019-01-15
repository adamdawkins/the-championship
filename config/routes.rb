Rails.application.routes.draw do
  devise_for :leaders, only: [ :sessions, :passwords ]

  resources :teams, only: [:index, :show]
  
  namespace :admin do
    resources :contestants
    resources :teams
    resources :tasks do
      resources :scorings, only: [:create, :destroy]
    end
    put "/tasks/:id/start", to: "tasks#start", as: :start_task
    put "/tasks/:id/stop", to: "tasks#stop", as: :stop_task
  end

  get "admin", to: "admin/teams#new"

  root to: "championship#index"
end

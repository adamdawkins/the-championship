Rails.application.routes.draw do
  namespace :admin do
    resources :teams
  end
  devise_for :leaders, only: [ :sessions, :passwords ]
  
  namespace :admin do
    resources :contestants
    resources :teams
    resources :tasks
    put "/tasks/:id/start", to: "tasks#start", as: :start_task
    put "/tasks/:id/stop", to: "tasks#stop", as: :stop_task
  end

  get "admin", to: "admin/teams#new"

  root to: "championship#index"
end

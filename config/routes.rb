Rails.application.routes.draw do
  devise_for :leaders, only: [ :sessions, :passwords ]
  
  namespace :admin do
    resources :contestants
  end

  root to: "admin/contestants#new"
end

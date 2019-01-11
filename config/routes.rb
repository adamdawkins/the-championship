Rails.application.routes.draw do
  devise_for :leaders, only: :sessions
end

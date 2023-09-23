Rails.application.routes.draw do
  devise_for :users

  resources :wines
  root 'wines#index'
end

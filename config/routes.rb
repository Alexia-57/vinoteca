Rails.application.routes.draw do
  devise_for :users

  resources :wines
  root to: 'pages#home'
end

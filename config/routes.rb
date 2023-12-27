# Rails.application.routes.draw do
#   devise_for :users, controllers: {
#   registrations: 'users/registrations'
# }


#   resources :wines
#   root to: 'pages#home'
# end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :wines do
    get 'empty', on: :collection, action: :empty_wines
  end

  root to: 'pages#home'
end

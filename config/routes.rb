Rails.application.routes.draw do
  devise_for :users, controllers: { users: 'users', sessions: 'users/sessions' }  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :users, only: %i[destroy index create] do
    resources :articles
  end
end

Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  resources :users
  resources :categories
  get 'signup',to: 'users#new'
end

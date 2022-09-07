Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  resources :users,except:[:new]
  resources :categories
  get 'signup',to: 'users#new'
  
end

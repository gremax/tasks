Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects
  resources :tasks
  resources :users
  get  'signup' => 'users#new',    as: :signup
  get  'signin' => 'sessions#new', as: :signin
  post 'signin' => 'sessions#create'
end

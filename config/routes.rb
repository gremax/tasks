Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects
  resources :tasks
  resources :users
  get  '/signup' => 'users#new', as: :signup
end

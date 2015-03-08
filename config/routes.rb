Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :projects do
    collection { post :sort }
  end
  resources :tasks do
    collection { post :sort }
  end
  resources :users
  get    'signup'  => 'users#new',        as: :signup
  get    'signin'  => 'sessions#new',     as: :signin
  post   'signin'  => 'sessions#create'
  delete 'signout' => 'sessions#destroy', as: :signout
end

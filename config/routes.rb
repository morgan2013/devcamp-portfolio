Rails.application.routes.draw do
  resources :comments
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'pages#home'
  resources :portfolios do
    put :sort, on: :collection
  end
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  get 'about',   to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'angular-items', to: 'portfolios#angular'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

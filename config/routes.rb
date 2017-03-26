Rails.application.routes.draw do
  root to: 'pages#home'
  resources :portfolios
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

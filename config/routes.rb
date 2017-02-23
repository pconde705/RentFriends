Rails.application.routes.draw do
  post 'offers/search' => 'offers#search', as: 'search_offers'

  get '/dashboard' => 'dashboard#index', as: 'dashboard'

  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :offers do
    resources :matches, only: [ :new, :create ]
  end
  resources :matches, only: [ :destroy ]
end

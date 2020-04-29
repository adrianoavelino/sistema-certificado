Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :participants
  resources :events
  resources :emission_sectors
  resources :certification_types
  resources :certificates
  root 'home#index'
  get 'search', to: 'search#certificates'
  get 'shipping', to: 'shipping#index'
end

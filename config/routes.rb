Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  resources :alunos
  resources :eventos
  resources :emission_sectors
  resources :certification_types
  resources :certificados
  root 'home#index'
  get 'search', to: 'search#certificados'
  get 'shipping', to: 'shipping#index'
end

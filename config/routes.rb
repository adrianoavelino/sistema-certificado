Rails.application.routes.draw do
  devise_for :usuarios, controllers: { registrations: 'usuarios/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :usuarios
  resources :alunos, only: [:new, :create, :update, :destroy]
  root 'home#index'
end

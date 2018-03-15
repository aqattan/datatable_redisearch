Rails.application.routes.draw do
  resources :physicians
  resources :people
  resources :insurances
  root 'people#index'
  get '/search', to: 'people#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

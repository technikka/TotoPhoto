Rails.application.routes.draw do
  resources :static_pages, only: [:index]
  root 'static_pages#index'
end

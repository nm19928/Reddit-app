Rails.application.routes.draw do
  resources :users do
    resources :sub
  end
  resources :sessions
  resources :sub
  resources :post do
    resources :comment
  end
  resources :comment
end

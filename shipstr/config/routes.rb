Rails.application.routes.draw do
  resources :shipping_rates
  resources :shipping_service_providers
  root to: "shipping_service_providers#export"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

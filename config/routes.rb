Rails.application.routes.draw do
  resources :exercises
  root "dashboard#index"
end

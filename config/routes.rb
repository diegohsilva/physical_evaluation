Rails.application.routes.draw do
  resources :students
  resources :exercises
  root "dashboard#index"
end

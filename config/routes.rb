Rails.application.routes.draw do
  devise_for :users
  resources :students
  resources :exercises
  root "dashboard#index"
end

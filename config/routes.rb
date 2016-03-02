Rails.application.routes.draw do
  resources :trainings
  resources :evaluations
  resources :evaluators
  devise_for :users
  resources :students
  resources :exercises
  root "dashboard#index"
end

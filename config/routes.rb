Rails.application.routes.draw do
  
  resources :trainings
  resources :evaluations

  resources :evaluators do
		get :autocomplete_evaluator_name, :on => :collection   
   end
  
  devise_for :users
  
  resources :students do 
  	get :autocomplete_student_name, :on => :collection
  end
  
  resources :exercises
  
  root "dashboard#index"
end

MedicalOffice::Application.routes.draw do
  
  devise_for :users, :controllers => { :sessions => "users/sessions" }
  
  resources :address_labels
  resources :health_insurance_labels
  resources :health_insurances
  resources :telephone_labels
  resources :patient_history_labels

  resources :patients
  resources :plastic_surgery_patients
  resources :dermatology_patients
  resources :occupational_therapy_patients

  resources :users, :except => [:edit]
  get 'users/:id/edit_password' => 'users#edit_password', :as => 'edit_user_password'
  post 'users/:id/update_password' => 'users#update_password', :as => 'update_user_password'
  
  resources :home

	root :to => 'home#index'
end

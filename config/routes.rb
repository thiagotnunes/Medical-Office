MedicalOffice::Application.routes.draw do
  
  devise_for :users,  :controllers => { :registrations => "users/registrations" }
  
  resources :address_labels

  resources :health_insurance_labels
  resources :health_insurances

  resources :telephone_labels

  resources :patients
  resources :plastic_surgery_patients
  resources :dermatology_patients
  resources :occupational_therapy_patients
  
  resources :patient_history_labels
  
  resources :build_home

	root :to => 'home#index'
end

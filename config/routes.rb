ActionController::Routing::Routes.draw do |map|

  map.resources :address_labels

  map.resources :health_insurance_labels
  map.resources :health_insurances

  map.resources :telephone_labels

  map.resources :patients
  map.resources :plastic_surgery_patients
  map.resources :dermatology_patients
  map.resources :occupational_therapy_patients
  
  map.resources :patient_history_labels

	map.root :controller => 'plastic_surgery_patients'

	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

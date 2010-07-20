ActionController::Routing::Routes.draw do |map|
  map.resources :evolution_pictures

  map.resources :health_insurances

  map.resources :telephone_labels

  map.resources :patients
  map.patient_evolutions_list 'patients/:id/evolutions', :controller => 'evolutions', :action => 'index'
  map.patient_telephones_list 'patients/:id/telephones', :controller => 'telephones', :action => 'index'

  map.resources :plastic_surgery_patients

	map.root :controller => 'plastic_surgery_patients'

	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

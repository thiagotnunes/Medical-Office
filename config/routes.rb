ActionController::Routing::Routes.draw do |map|
  map.resources :evolution_pictures

  map.resources :health_insurances

  map.resources :telephone_labels

  map.resources :patients, :has_many => :telephones, :has_many => :evolutions

	map.root :controller => "patients"

	map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

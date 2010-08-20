module ApplicationHelper
	def link_to_remove_fields(name, f)
		f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
	end

	def link_to_add_fields(name, f, prefix, association, render_remove_button = true)
  	new_object = f.object.class.reflect_on_association(association).klass.new  
  	fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
    	render("#{prefix}/#{association.to_s.singularize}", :f => builder, :render_remove_button => render_remove_button)  
  	end  
  	link_to_function(name, h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :id => name.gsub(/\s/, "_").downcase)  
	end  
	
	def render_nested_patient_information_for(element, f, render_remove_button = true)
	  render 'patients_templates/nested_elements', :f => f, :prefix => :patients_templates, :element => element, :render_remove_button => render_remove_button
  end
end

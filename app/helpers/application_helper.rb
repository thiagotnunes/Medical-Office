module ApplicationHelper
  
  PATIENTS_FORM_TEMPLATES_PATH = 'patients_form_templates'
  
  GENERAL_SHOW_TEMPLATES_PATH = 'general_show_templates'
  PATIENTS_SHOW_TEMPLATES_PATH = 'patients_show_templates'
  
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
	
	def render_nested_form_patient_information_for(element, f, render_remove_button = true)
	  render "#{PATIENTS_FORM_TEMPLATES_PATH}/nested_elements", :f => f, :prefix => :patients_form_templates, :element => element, :render_remove_button => render_remove_button
  end
  
end

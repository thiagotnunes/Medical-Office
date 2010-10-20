module PatientHelper
  
  PATIENTS_FORM_TEMPLATES_PATH = 'patients_form_templates'
  PATIENTS_SHOW_TEMPLATES_PATH = 'patients_show_templates'
  
  PATIENTS_PROFILES = [ 
    PatientProfile.new(:dermatology_patients, :new, 'Dermatology Patient'),
    PatientProfile.new(:occupational_therapy_patients, :new, 'Occupational Therapy Patient'),
    PatientProfile.new(:plastic_surgery_patients, :new, 'Plastic Surgery Patient')
  ]
  
  def get_edit_path(patient)
    return edit_dermatology_patient_path(patient) if patient.type == Patient::DERMATOLOGY_PATIENT_TYPE
    return edit_occupational_therapy_patient_path(patient) if patient.type == Patient::OCCUPATIONAL_THERAPY_PATIENT_TYPE
    return edit_plastic_surgery_patient_path(patient) if patient.type == Patient::PLASTIC_SURGERY_PATIENT_TYPE
  end
  
  def render_nested_form_patient_information_for(element, f, render_remove_button = true)
	  render "#{PATIENTS_FORM_TEMPLATES_PATH}/nested_elements", :f => f, :prefix => :patients_form_templates, :element => element, :render_remove_button => render_remove_button
  end
  
end

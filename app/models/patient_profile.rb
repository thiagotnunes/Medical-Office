class PatientProfile
  
  attr_accessor :url, :name
  
  def initialize(controller, action, name)
    @url = "/#{controller}/#{action}"
    @name = name
  end
  
end

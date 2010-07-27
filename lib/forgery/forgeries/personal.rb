class Forgery::Personal
  
  def self.color
    dictionaries[:skin_colors].random
  end
  
  def self.marital_status
    dictionaries[:marital_statuses].random
  end
  
end

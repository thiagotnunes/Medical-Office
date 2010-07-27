class Forgery::Name
  
  def self.telephone_label
    dictionaries[:telephone_labels].random
  end
  
  def self.address_label
    dictionaries[:address_labels].random
  end
  
  def self.profession
    dictionaries[:professions].random
  end
  
end

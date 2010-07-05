Factory.define :evolution do |e|
  e.attendance_date Date.today
  e.description "Description"
end

Factory.define :health_insurance do |hi|
  hi.name "SUS"
end

Factory.define :patient do |p|
  p.name "Name surname"
  p.cpf "22233366638"
  p.rg "1234567890"
  p.sex "Male"
  p.birth_date Date.today
  p.address "Address"
  p.address_number "123"
  p.health_insurance_number "123"
  p.health_insurance { |h| h.association(:health_insurance) } 
end

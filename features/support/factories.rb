Factory.sequence :telephone_label_label do |n|
  "#{Forgery::Name.company_name}#{n}"
end

Factory.define :evolution do |e|
  e.attendance_date Date.today
  e.description Forgery::Basic.text
  e.patient { |p| p.association(:patient) }
end

Factory.define :health_insurance do |hi|
  hi.sequence(:name) { |n| "#{Forgery::Name.company_name}#{n}" }
end

Factory.define :patient do |p|
  p.name Forgery::Name.full_name
  p.cpf Forgery::Brazil.valid_cpf
  p.rg Forgery::Brazil.valid_rg
  p.sex Forgery::Personal.gender
  p.birth_date Date.today
  p.address Forgery::Address.street_address
  p.address_number Forgery::Basic.number
  p.health_insurance_number Forgery::Basic.number
  p.health_insurance { |h| h.association(:health_insurance) } 
end

Factory.define :telephone_label do |tl|
  tl.label Factory.next :telephone_label_label
end

Factory.define :telephone do |t|
  t.number "%10d" % Forgery::Basic.number
  t.telephone_label { |tl| tl.association(:telephone_label) }
  t.patient { |p| p.association(:patient) }
end

Factory.sequence :health_insurance_name do |n|
  "#{Forgery::Name.company_name}#{n}"
end

Factory.define :evolution do |e|
  e.attendance_date Date.today
  e.description Forgery::Basic.text
  e.patient { |p| p.association(:patient) }
end

Factory.define :health_insurance do |hi|
  hi.name Factory.next :health_insurance_name
end

Factory.define :patient do |p|
  p.name Forgery::Name.full_name
  p.cpf Forgery::Cpf.valid_cpf
  p.rg "1234567890"
  p.sex Forgery::Personal.gender
  p.birth_date Date.today
  p.address Forgery::Address.street_address
  p.address_number Forgery::Basic.number
  p.health_insurance_number Forgery::Basic.number
  p.health_insurance { |h| h.association(:health_insurance) } 
end

Factory.define :telephone_label do |tl|
  tl.label Forgery::Name.company_name
end

Factory.define :telephone do |t|
  t.number Forgery::Basic.number
  t.telephone_label { |tl| tl.association(:telephone_label) }
  t.patient { |p| p.association(:patient) }
end

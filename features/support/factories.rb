Factory.define :evolution do |e|
  e.attendance_date Date.today
  e.description Forgery::Basic.text
  e.patient { |p| p.association(:patient) }
end

Factory.define :health_insurance do |hi|
  hi.sequence(:name) { |n| "#{Forgery::Name.company_name}#{n}" }
end

Factory.define :Address do |a|
  a.location Forgery::Address.street_address
  a.complement Forgery::Address.street_number
  a.address_label { |al| al.association(:address_label) }
  a.patient { |p| p.association(:patient) }
end

Factory.define :patient do |p|
  p.name Forgery::Name.full_name
  p.cpf Forgery::Brazil.valid_cpf
  p.rg Forgery::Brazil.valid_rg
  p.sex Forgery::Personal.gender
  p.color Forgery::Personal.color
  p.birth_date Date.today
  p.profession Forgery::Name.profession
  p.city Forgery::Address.city
  p.state Forgery::Address.state
  p.country Forgery::Address.country
  p.fathers_name Forgery::Name.male_first_name
  p.mothers_name Forgery::Name.female_first_name
  p.forwarded_by Forgery::Name.full_name
  p.marital_status Forgery::Name.marital_status
  p.health_insurance_number Forgery::Basic.number
  p.health_insurance { |h| h.association(:health_insurance) } 
end

Factory.define :address_label do |al|
  al.sequence(:label) { |n| "#{Forgery::Name.address_label} #{n}" }
end

Factory.define :telephone_label do |tl|
  tl.sequence(:label) { |n| "#{Forgery::Name.telephone_label} #{n}" }
end

Factory.define :telephone do |t|
  t.number "%10d" % Forgery::Basic.number
  t.telephone_label { |tl| tl.association(:telephone_label) }
  t.patient { |p| p.association(:patient) }
end

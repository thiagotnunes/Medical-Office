Factory.sequence :telephone_label do |n|
  "#{Forgery::Name.telephone_label} #{n + (rand * 10)}"
end

Factory.sequence :address_label do |n|
  "#{Forgery::Name.address_label} #{n + (rand * 10)}"
end

Factory.sequence :patient_history_label do |n|
  "#{Forgery::Name.patient_history_label} #{n + (rand * 10)}"
end

Factory.define :patient do |p|
  p.record Forgery::Basic.number
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
  p.fathers_name "#{Forgery::Name.male_first_name} #{Forgery::Name.last_name}"
  p.mothers_name "#{Forgery::Name.female_first_name} #{Forgery::Name.last_name}"
  p.forwarded_by Forgery::Name.full_name
  p.marital_status Forgery::Personal.marital_status
  p.health_insurance_number Forgery::Basic.number
  p.association :health_insurance, :factory => :health_insurance
  p.first_appointment Date.today
  p.addresses do 
    [Factory.build(:address)]
  end
  p.telephones do
    [Factory.build(:telephone)]
  end
end

Factory.define :plastic_surgery_patient, :parent => :patient do |psp|
  psp.type "PlasticSurgeryPatient"
end

Factory.define :evolution do |e|
  e.attendance_date Date.today
  e.description Forgery::Basic.text
end

Factory.define :health_insurance do |hi|
  hi.sequence(:name) { |n| "#{Forgery::Name.company_name} #{n}" }
end

Factory.define :address do |a|
  a.location Forgery::Address.street_address
  a.complement Forgery::Address.street_number
  a.address_label { |al| al.association(:address_label, :label => Factory.next(:address_label)) }
end

Factory.define :telephone do |t|
  t.number "%010d" % Forgery::Basic.number
  t.telephone_label { |tl| tl.association(:telephone_label, :label => Factory.next(:telephone_label)) }
end

Factory.define :patient_history_label do |ph|
  ph.label Factory.next(:patient_history_label)
end

Factory.define :telephone_label do |tl|
  tl.label Factory.next(:telephone_label)
end

Factory.define :address_label do |al|
  al.label Factory.next(:address_label)
end

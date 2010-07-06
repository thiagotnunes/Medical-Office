Given /^I have health insurances named (.+)$/ do |names|
  names.split(', ').each do |name|
    Factory(:health_insurance, :name => name)
  end
end

Given /^I have no health insurances$/ do
  HealthInsurance.delete_all
end

Then /^I should have (\d+) health insurances$/ do |count|
  HealthInsurance.count.should == count.to_i
end


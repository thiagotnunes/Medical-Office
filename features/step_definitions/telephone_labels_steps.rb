Given /^I have telephone labels labeled (.+)$/ do |labels|
  labels.split(', ').each do |label|
    Factory(:telephone_label, :label => label)
  end
end

Given /^I have no telephone labels$/ do
  TelephoneLabel.delete_all
end

Then /^I should have (\d+) telephone labels?$/ do |count|
  TelephoneLabel.count.should == count.to_i
end


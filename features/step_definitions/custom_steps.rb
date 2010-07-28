When /^I fill in "([^"]*)" of the "([^"]*)" (\d+) with "([^"]*)" for the "([^"]*)"$/ do |nested_field, field, number, value, clazz|
    name = "#{clazz.gsub(" ", "_").downcase}_" + field.gsub(" ", "_").downcase.pluralize + "_attributes_#{number}_#{nested_field.gsub(" ", "_").downcase}"
    puts "I fill in #{name} with #{value}"
    When %{I fill in "#{name}" with "#{value}"}
end

When /^I fill in "([^"]*)" (\d+) with "([^"]*)" for the "([^"]*)"$/ do |nested_field,  number, value, clazz|
  name = "#{clazz.gsub(" ", "_").downcase}[" + nested_field.gsub(" ", "_").downcase.pluralize + "_attributes][#{number}][#{nested_field.gsub(" ", "_").downcase}]"
  When %{I fill in "#{name}" with "#{value}"}
end

When /^I fill in "([^"]*)" \#(\d+) of the "([^"]*)" with "([^"]*)" for the "([^"]*)"$/ do |nested_field,  number, field, value, clazz|
    name = "#{clazz.gsub(" ", "_").downcase}[" + field.gsub(" ", "_").downcase.pluralize + "_attributes][#{number}][#{nested_field.gsub(" ", "_").downcase}]"
    puts %{I fill in "#{name}" with "#{value}"}
    When %{I fill in "#{name}" with "#{value}"}
end

When /^I fill in "([^"]*)" \#(\d+) with "([^"]*)" for the "([^"]*)"$/ do |nested_field,  number, value, clazz|
  name = "#{clazz.gsub(" ", "_").downcase}[" + nested_field.gsub(" ", "_").downcase.pluralize + "_attributes][#{number}][#{nested_field.gsub(" ", "_").downcase}]"
  When %{I fill in "#{name}" with "#{value}"}
end

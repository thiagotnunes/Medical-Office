Given /^I have the following (.+) records?$/ do |factory, table|
  factory[" "] = "_"
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

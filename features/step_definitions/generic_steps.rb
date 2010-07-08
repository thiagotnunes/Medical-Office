Given /^I have the following (.+) records?$/ do |factory, table|
  unless factory[" "].nil? 
    factory[" "] = "_"
  end
  table.hashes.each do |hash|
    Factory(factory, hash)
  end
end

Given /a saved (\S*)/ do |factory_name|
  # => Set an instance variable to the factory name and build the factory
  instance_variable_set("@#{factory_name}", create(factory_name))
end

Given /^an unsaved (\S*)$/ do |factory_name|
  # => Set an instance variable to the factory name and build the factory
  instance_variable_set("@#{factory_name}", build(factory_name))
end

Given /^the attributes are extracted from (\S*)$/ do |instance_var_name|
  @attributes = instance_variable_get("@#{instance_var_name}").attributes
end

Given /^the attributes key (\S*) is set to (.*)$/ do |key, value|
  @attributes[key] = value
end

Given /^the (\S*) field (\S*) is set to (.*)$/ do |instance_var_name, field, value|
  instance_variable_get("@#{instance_var_name}").send("#{field}=", value)
end

Given /^I test the (\S*)$/ do |response|
  hash = JSON.parse(last_response.body)
  binding.pry
end

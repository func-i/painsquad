Given /a saved (\S*)/ do |factory_name|
  # => Set an instance variable to the factory name and build the factory
  instance_variable_set("@#{factory_name}", create(factory_name))
end

Given /^an unsaved (\S*)$/ do |factory_name|
  # => Set an instance variable to the factory name and build the factory
  instance_variable_set("@#{factory_name}", build(factory_name))
end

Given /^I should receive a (\d+) response code$/ do |code|
  last_response.status.should eql(code.to_i)
end

Given /^the path should be (\S*)$/ do |path|
  current_path.should eql(path)
end

Given /the response should have the key (.*)/ do |key|
  hash = JSON.parse(last_response.body)
  hash.has_key?(key).should == true
end

Given /^the (\S*) hash should have the key (\S*)$/ do |hash_key, key_name|
  hash = JSON.parse(last_response.body)

  # => Check if the hash reference has periods in it.  Eg:  user.session
  hash_key.split(".").each do |k|
    # => Make sure the hash has each level of nesting
    hash.has_key?(k).should == true

    # => If the response is an array, we still want to make sure one of the results
    # => has the keys.  Get the first object in the array.
    # => This assumes all entries in the array are the same
    hash = hash[k].kind_of?(Array) ? hash[k].first : hash[k]
  end

  # => Once we've traversed the object, check to make sure the last object has our key
  hash.has_key?(key_name).should == true
end

Given /^the (.*) hash should not have the key (.*)$/ do |hash_key, key_name|
  hash = JSON.parse(last_response.body)

  # => Check if the hash reference has periods in it.  Eg:  user.session
  hash_key.split(".").each do |k|
    # => Make sure the hash has each level of nesting
    hash.has_key?(k).should == true

    # => If the response is an array, we still want to make sure one of the results
    # => has the keys.  Get the first object in the array.
    # => This assumes all entries in the array are the same
    hash = hash[k].kind_of?(Array) ? hash[k].first : hash[k]
  end

  # => Once we've traversed the object, check to make sure the last object has our key
  hash.has_key?(key_name).should_not == true
end

Given /^the (\S*) hash should have the key (\S*) and it should equal "(.*?)"$/ do |hash_key, key_name, value|
  hash = JSON.parse(last_response.body)

  # => Check if the hash reference has periods in it.  Eg:  user.session
  hash_key.split(".").each do |k|
    # => Make sure the hash has each level of nesting
    hash.has_key?(k).should == true

    # => If the response is an array, we still want to make sure one of the results
    # => has the keys.  Get the first object in the array.
    # => This assumes all entries in the array are the same
    hash = hash[k].kind_of?(Array) ? hash[k].first : hash[k]
  end

  # => Once we've traversed the object, check to make sure the last object has our key
  hash.has_key?(key_name).should == true
  hash[key_name].to_s.should == value
end

Given /^the (\S*) hash should have the key (\S*) and it should be a (\S*)$/ do |hash_key, key_name, type|
  hash = JSON.parse(last_response.body)

  # => Check if the hash reference has periods in it.  Eg:  user.session
  hash_key.split(".").each do |k|
    # => Make sure the hash has each level of nesting
    hash.has_key?(k).should == true

    # => If the response is an array, we still want to make sure one of the results
    # => has the keys.  Get the first object in the array.
    # => This assumes all entries in the array are the same
    hash = hash[k].kind_of?(Array) ? hash[k].first : hash[k]
  end

  # => Once we've traversed the object, check to make sure the last object has our key
  hash.has_key?(key_name).should == true
  hash[key_name].should be_a type.constantize
end

Given /^I hit the surveys path$/ do
  get api_surveys_path
end

Given /^the survey (\S*) should be set$/ do |value|
  json_body["survey"][value].should eql(@survey[value])
end

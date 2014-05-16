# Given /^I visit the surveys endpoint$/ do
#   get api_surveys_path
# end

# Given /^the survey (\S*) should be set$/ do |value|
#   hash = JSON.parse(last_response.body)
#   hash["survey"][value].should eql(@survey.send(value))
# end

# Given /^the survey has (\S*)$/ do |value|
# end

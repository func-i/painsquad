Given /^I hit the surveys path$/ do
  get api_v1_surveys_path
end

Given /^the first surveys title should be set$/ do
  json_body["surveys"].first["title"].should eql(@survey.title)
end
Given(/^I post to "(.*?)" with:$/) do |path, json_body|
  post path, json_body
end

Given /^I create the submission$/ do
  post api_submissions_path, submission: @submission.attributes
end

Given /^an empty submission$/ do
  @submission = build(:submission, survey: nil)
end
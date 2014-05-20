Given(/^I post to "(.*?)" with:$/) do |path, json_body|
  post path, json_body
end

Given /^I create the submission$/ do
  attributes = @submission.attributes
  attributes[:answers_attributes] = [@submission.answers.map(&:attributes)]
  post api_submissions_path, submission: attributes
  # post api_submissions_path, submission: @submission.print_tree
end

Given /^an empty submission$/ do
  @submission = build(:submission, survey: nil)
end

Given /^I test the (\S*)$/ do |response|
  hash = JSON.parse(last_response.body)
  binding.pry
end

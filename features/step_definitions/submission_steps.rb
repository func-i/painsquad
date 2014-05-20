Given(/^I post to "(.*?)" with:$/) do |path, json_body|
  post path, json_body
end

Given /^I create the submission$/ do
  attributes = @submission.attributes
  attributes[:answers_attributes] = [@submission.answers.map(&:attributes)]
  post api_submissions_path, submission: attributes
end

Given /^an empty submission$/ do
  @submission = build(:submission, survey: nil)
end

Given /^the first entry at "(.*?)" should have the key (\S*)$/ do |hash_key, key|
  hash   = JSON.parse(last_response.body)
  keys   = hash_key.split('.')
  target = keys.inject(hash, &:fetch)
  target.first.has_key?(key).should be_true
end

Given /the first entry at "(.*?)" should have a valid (\S*)$/  do |hash_key, object|
  hash   = JSON.parse(last_response.body)
  keys   = hash_key.split('.')
  target = keys.inject(hash, &:fetch)
  target.first[object].is_a?(Hash).should be_true
end

# Given /^I test the (\S*)$/ do |response|
#   hash = JSON.parse(last_response.body)
#   binding.pry
# end

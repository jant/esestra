Given /^I am not yet using system$/ do
end

When /^I go to the main page$/ do
  visit surgeries_path
end

Then /^I should see "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

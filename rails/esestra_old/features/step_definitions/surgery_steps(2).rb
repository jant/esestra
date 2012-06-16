Given /^I am not yet using system$/ do
end

When /^I go to the main page$/ do
  visit surgeries_path
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end


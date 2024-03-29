When /^(?:|I )return to (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then /^I should see error messages$/ do
  page.should have_css("#errorExplanation")
end

Then /^I should see "([^\"]*)" translation$/ do |key|
  page.should have_content(I18n.t(key))
end

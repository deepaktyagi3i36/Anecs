Then /^I should be logged in$/ do
  page.should have_content("Logout")
end

Then /^I should be logged out$/ do
  page.should have_content("Login")
end

Given /^I am signed up as "(.+)\/(.+)"$/ do |login, password|
  Factory(:user, :login => login, :password => password, :password_confirmation => password)
end

Given /^I have an admin account of "(.+)\/(.+)"$/ do |login, password|
  Factory(:admin_user,  :login => login, :password => password, :password_confirmation => password)
end

Given /^I have an moderator account of "(.+)\/(.+)"$/ do |login, password|
  Factory(:moderator_user,  :login => login, :password => password, :password_confirmation => password)
end

Given /^I have an hrmanager account of "(.+)\/(.+)"$/ do |login, password|
  Factory(:hrmanager_user,  :login => login, :password => password, :password_confirmation => password)
end

When /^I sign in as "(.*)\/(.*)"$/ do |login, password|
  When %{I go to the sign in page"}
  And %{I fill in "Login" with "#{login}"}
  And %{I fill in "Password" with "#{password}"}
  And %{I press "Login"}
end

Given /^I am logged out$/ do
  begin
    click_link("Logout")
  rescue Capybara::ElementNotFound
  end
end

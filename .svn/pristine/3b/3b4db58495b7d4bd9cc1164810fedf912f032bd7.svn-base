Given /^the main menu and welcome list menu exist$/ do
  @main_menu_items = []
  @list_menu_items = []
end

Then /^I should see navigation and project news and events$/ do
  page.all('ul.breadcrumbs li').size.should == 3
  page.all('ul#main-menu li').size.should == 4
  page.all('ul#nav>li').size.should == 3              # Metanavigation
  page.all('ul#list-menu li').size.should == 1
end

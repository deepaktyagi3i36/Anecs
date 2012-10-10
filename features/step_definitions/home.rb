Given /^the main menu exist$/ do
  @main_menu_items = []
end

Then /^I should see navigation and anthill image with key features$/ do
  page.all('ul.breadcrumbs li').size.should == 1
  page.all('ul#main-menu li').size.should == 4
  page.all('ul#nav>li').size.should == 3              # Metanavigation
end

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    # Home pages
    when /the home\s?page/
      '/'
    when /the anthill home page/
      '/home/anthill'
    # Welcome pages
    when /the news and events page/
      '/welcome/news_events'
    # About us pages
    # Account pages
    when /the sign in page/
      login_path
    when /the sign out page/
      logout_path
    when /the sign up page/
      signup_path
    when /the resend page/
      resend_path
    when /the forgot page/
      forgot_path
    when /the reset page/
      reset_path
    when /the activate page/
      activate_path
    when /the new session page/
      new_session_path
    when /the backoffice page/
      backoffice_path
    when /the framework page/
      framework_path
    when /my account page/
      myaccount_path
    when /my dashboard page/
      myaccount_account_dashboard_path
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

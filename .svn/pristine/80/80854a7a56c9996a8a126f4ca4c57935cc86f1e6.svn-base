class HomeController < ApplicationController
  # ::Rails.logger.error("...")

  # Setup layout
  layout 'greetings'

  # Don't use redirect here, flash will disappear
  def index
		@categories = Category.find(:all,
                                :conditions=>["categories.website_id = ? and categories.ancestry is null", @website.id],
                                :order=>"categories.weight desc, categories.name asc")
    render :action => "index"
  end

  def sitemap
    render :action => "sitemap"
  end

  def terms_of_use
    render :action => "terms_of_use"
  end

  def privacy_policy
    render :action => "privacy_policy"
  end

  def search_results
    render :action => "search_results"
  end

end

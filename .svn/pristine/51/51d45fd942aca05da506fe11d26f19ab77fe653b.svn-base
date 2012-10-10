class ManpagesController < ApplicationController
  # ::Rails.logger.error("...")
  layout "manpages"

  # Include extra helpers
  # helper 'categories'

  # Include filters
  # before_filter :load_data

  #caches_action :index
  #caches_action :show, :cache_path => Proc.new { |c| c.params }

  def index
    # Find all child manpages in current section
    @manpages = Manpage.find(:all, :conditions => ManpageFilter.enabled_conditions(), :order => "treepath")

    # Create a breadcrumbs
    add_breadcrumbs_by_path
  end

  def show
    if params[:id]
      @manpage = Manpage.find(params[:id])
    elsif params[:code]
      @manpage = Manpage.find_by_code(params[:code])
    end

    # Create a breadcrumbs based on manpage
    add_breadcrumbs_by_path
    set_breadcrumb_for @manpage
  end

  private
  def set_breadcrumb_for manpage
    breadcrumbs = []
    breadcrumbs << [manpage.name, manpage.url]
    while !manpage.parent_id.nil? && manpage.parent_id > 0
      manpage = Manpage.find manpage.parent_id
      breadcrumbs << [manpage.name, manpage.url]
    end

    # Push breadcrums back order
    breadcrumbs.reverse.each do |item|
      add_breadcrumb item[0], item[1]
    end
  end


end

class ArticlesController < ApplicationController
  # ::Rails.logger.error("...")
  layout "articles"

  # Include extra helpers
  # helper 'categories'

  # Include filters
  # before_filter :load_data

  #caches_action :index
  #caches_action :show, :cache_path => Proc.new { |c| c.params }

  def index
    # Find all child articles in current section
    @articles = Article.find(:all, :conditions => ArticleFilter.enabled_conditions(), :order => "treepath")

    # Create a breadcrumbs
    add_breadcrumbs_by_path
  end

  def show
    if params[:id]
      @article = Article.find(params[:id])
    elsif params[:code]
      @article = Article.find_by_code(params[:code])
    end

    # Create a breadcrumbs based on article
    add_breadcrumbs_by_path
    set_breadcrumb_for @article
  end

  private
  def set_breadcrumb_for article
    breadcrumbs = []
    breadcrumbs << [article.name, article.url]
    while !article.parent_id.nil? && article.parent_id > 0
      article = Article.find article.parent_id
      breadcrumbs << [article.name, article.url]
    end

    # Push breadcrums back order
    breadcrumbs.reverse.each do |item|
      add_breadcrumb item[0], item[1]
    end
  end
end

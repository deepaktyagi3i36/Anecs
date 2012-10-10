class Backoffice::Website::Contents::ArticlesController < Backoffice2lController
  # ::Rails.logger.error("...")

  #cache_sweeper :article_sweeper



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @article_filter = ArticleFilter.new(params[:article_filter])
    @articles = Article.paginate :include => [:parent], :conditions => @article_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    load_data
    @article = Article.new
  end



  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = I18n.t("activeview.flashes.article.notices.created")
      redirect_to :action => "edit", :id => @article.id
    else
      load_data
      render :action => "new"
    end
  end


  def edit
    load_data
    @article = Article.find(params[:id])
  end



  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = I18n.t("activeview.flashes.article.notices.updated")
      redirect_to :action => "edit", :id => @article.id
    else
      load_data
      render :action => "edit"
    end
  end



  def destroy
    Article.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.article.notices.deleted")
    redirect_to :action => "index"
  end



  def export
    result = ""
    cast_ids_to_i(params).each do |id|
      article = Article.find_by_id(id)
      next if article.nil?
      result += article.name + "\r\n" if ids.size() > 1
      result += article.content
      result += "\r\n\r\n\r\n" if ids.size() > 1
    end

    send_data(result,:filename => "content.txt",
      :type => "txt/txt", :disposition => "inline")
  end

  private
  # Method to prepare data for new & edit
  def load_data
    @parents =  ([Article.new] + Article.find(:all))
    @article_types = ArticleType.find(:all)
  end

end

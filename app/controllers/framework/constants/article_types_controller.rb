class Framework::Constants::ArticleTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @article_type_filter = ArticleTypeFilter.new(params[:article_type_filter])
    @article_types = ArticleType.paginate :conditions => @article_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @article_type = ArticleType.new
  end



  def create
    @article_type = ArticleType.new(params[:article_type])
    if @article_type.save
      flash[:notice] = I18n.t("article_types.flash.notices.created")
      redirect_to :action => "edit", :id => @article_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @article_type = ArticleType.find(params[:id])
  end



  def update
    @article_type = ArticleType.find(params[:id])
    if @article_type.update_attributes(params[:article_type])
      flash[:notice] = I18n.t("article_types.flash.notices.updated")
      redirect_to :action => "edit", :id => @article_type.id
    else
      render :action => "edit"
    end
  end



  def destroy
    ArticleType.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.article_type.notices.deleted")
    redirect_to :action => "index"
  end
end

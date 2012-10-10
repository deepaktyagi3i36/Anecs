class Framework::Constants::CommentTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @comment_type_filter = CommentTypeFilter.new(params[:comment_type_filter])
    @comment_types = CommentType.paginate :conditions => @comment_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @comment_type = CommentType.new
  end



  def create
    @comment_type = CommentType.new(params[:comment_type])
    if @comment_type.save
      flash[:notice] = I18n.t("comment_type.flash.notices.created")
      redirect_to :action => "edit", :id => @comment_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @comment_type = CommentType.find(params[:id])
  end



  def update
    @comment_type = CommentType.find(params[:id])
    if @comment_type.update_attributes(params[:comment_type])
      flash[:notice] = I18n.t("comment_type.flash.notices.updated")
      redirect_to :action => "edit", :id => @comment_type.id
    else
      render :action => "edit"
    end
  end



  def destroy
    CommentType.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.comment_type.notices.deleted")
    redirect_to :action => "index"
  end
end

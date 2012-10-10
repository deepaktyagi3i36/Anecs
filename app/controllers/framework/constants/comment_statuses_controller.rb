class Framework::Constants::CommentStatusesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @comment_status_filter = CommentStatusFilter.new(params[:comment_status_filter])
    @comment_statuses = CommentStatus.paginate :conditions => @comment_status_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @comment_status = CommentStatus.new
  end



  def create
    @comment_status = CommentStatus.new(params[:comment_status])
    if @comment_status.save
      flash[:notice] = I18n.t("comment_status.flash.notices.created")
      redirect_to :action => "edit", :id => @comment_status.id
    else
      render :action => "new"
    end
  end


  def edit
    @comment_status = CommentStatus.find(params[:id])
  end



  def update
    @comment_status = CommentStatus.find(params[:id])
    if @comment_status.update_attributes(params[:comment_status])
      flash[:notice] = I18n.t("comment_status.flash.notices.updated")
      redirect_to :action => "edit", :id => @comment_status.id
    else
      render :action => "edit"
    end
  end



  def destroy
    CommentStatus.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.comment_status.notices.deleted")
    redirect_to :action => "index"
  end
end

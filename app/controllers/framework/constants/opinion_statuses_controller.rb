class Framework::Constants::OpinionStatusesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @opinion_status_filter = OpinionStatusFilter.new(params[:opinion_status_filter])
    @opinion_statuses = OpinionStatus.paginate :conditions => @opinion_status_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @opinion_status = OpinionStatus.new
  end



  def create
    @opinion_status = OpinionStatus.new(params[:opinion_status])
    if @opinion_status.save
      flash[:notice] = I18n.t("opinions_status.flash.notices.created")
      redirect_to :action => "edit", :id => @opinion_status.id
    else
      render :action => "new"
    end
  end


  def edit
    @opinion_status = OpinionStatus.find(params[:id])
  end



  def update
    @opinion_status = OpinionStatus.find(params[:id])
    if @opinion_status.update_attributes(params[:opinion_status])
      flash[:notice] = I18n.t("opinions_status.flash.notices.updated")
      redirect_to :action => "edit", :id => @opinion_status.id
    else
      render :action => "edit"
    end
  end



  def destroy
    OpinionStatus.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.opinion_status.notices.deleted")
    redirect_to :action => "index"
  end
end

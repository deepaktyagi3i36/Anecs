class Framework::Constants::ComplaintStatusesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @complaint_status_filter = ComplaintStatusFilter.new(params[:complaint_status_filter])
    @complaint_statuses = ComplaintStatus.paginate :conditions => @complaint_status_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @complaint_status = ComplaintStatus.new
  end



  def create
    @complaint_status = ComplaintStatus.new(params[:complaint_status])
    if @complaint_status.save
      flash[:notice] = I18n.t("complaint_status.flash.notices.created")
      redirect_to :action => "edit", :id => @complaint_status.id
    else
      render :action => "new"
    end
  end


  def edit
    @complaint_status = ComplaintStatus.find(params[:id])
  end



  def update
    @complaint_status = ComplaintStatus.find(params[:id])
    if @complaint_status.update_attributes(params[:complaint_status])
      flash[:notice] = I18n.t("complaint_status.flash.notices.updated")
      redirect_to :action => "edit", :id => @complaint_status.id
    else
      render :action => "edit"
    end
  end



  def destroy
    cast_ids_to_i(params).each do |id|
      begin
        ComplaintStatus.destroy(cast_ids_to_i(params))
      rescue ActiveRecord::StatementInvalid
        # It's OK, record wasn't deleted due to fk
        flash[:warning] = I18n.t("activeview.flashes.complaint_status.warnings.skipped")
      end
    end

    flash[:notice] = I18n.t("activeview.flashes.complaint_status.notices.deleted")
    redirect_to :action => "index"
  end
end

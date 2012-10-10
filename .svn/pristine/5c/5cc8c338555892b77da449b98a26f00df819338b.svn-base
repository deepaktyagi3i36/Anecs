class Framework::Constants::ComplaintTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @complaint_type_filter = ComplaintTypeFilter.new(params[:complaint_type_filter])
    @complaint_types = ComplaintType.paginate :conditions => @complaint_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @complaint_type = ComplaintType.new
  end



  def create
    @complaint_type = ComplaintType.new(params[:complaint_type])
    if @complaint_type.save
      flash[:notice] = I18n.t("complaint_type.flash.notices.created")
      redirect_to :action => "edit", :id => @complaint_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @complaint_type = ComplaintType.find(params[:id])
  end



  def update
    @complaint_type = ComplaintType.find(params[:id])
    if @complaint_type.update_attributes(params[:complaint_type])
      flash[:notice] = I18n.t("complaint_type.flash.notices.updated")
      redirect_to :action => "edit", :id => @complaint_type.id
    else
      render :action => "edit"
    end
  end



  def destroy
    cast_ids_to_i(params).each do |id|
      begin
        ComplaintType.destroy(cast_ids_to_i(params))
      rescue ActiveRecord::StatementInvalid
        # It's OK, record wasn't deleted due to fk
        flash[:warning] = I18n.t("activeview.flashes.complaint_type.warnings.skipped")
      end
    end

    flash[:notice] = I18n.t("activeview.flashes.complaint_type.notices.deleted")
    redirect_to :action => "index"
  end
end

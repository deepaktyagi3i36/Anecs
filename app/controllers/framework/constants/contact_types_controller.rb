class Framework::Constants::ContactTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @contact_type_filter = ContactTypeFilter.new(params[:contact_type_filter])
    @contact_types = ContactType.paginate :conditions => @contact_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @contact_type = ContactType.new
  end



  def create
    @contact_type = ContactType.new(params[:contact_type])
    if @contact_type.save
      flash[:notice] = I18n.t("activeview.flashes.contact_type.notices.created")
      redirect_to :action => "edit", :id => @contact_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @contact_type = ContactType.find(params[:id])
  end



  def update
    @contact_type = ContactType.find(params[:id])
    if @contact_type.update_attributes(params[:contact_type])
      flash[:notice] = I18n.t("activeview.flashes.contact_type.notices.updated")
      redirect_to :action => "edit", :id => @contact_type.id
    else
      render :action => "edit"
    end
  end

  def enable
    @contact_type = ContactType.find(params[:id])
    if @contact_type.update_attribute(:enabled, 1)
      flash[:notice] = I18n.t("activeview.flashes.contact_type.notices.updated")
      redirect_to :action => :index
    else
      render :action => :index
    end
  end

  def disable
    @contact_type = ContactType.find(params[:id])
    if @contact_type.update_attribute(:enabled, 0)
      flash[:notice] = I18n.t("activeview.flashes.contact_type.notices.updated")
      redirect_to :action => :index
    else
      render :action => :index
    end
  end



  def destroy
    cast_ids_to_i(params).each do |id|
      begin
        ContactType.destroy(cast_ids_to_i(params))
      rescue ActiveRecord::StatementInvalid
        # It's OK, record wasn't deleted due to fk
        flash[:warning] = I18n.t("activeview.flashes.contact_type.warnings.skipped")
      end
    end
    flash[:notice] = I18n.t("activeview.flashes.contact_type.notices.deleted")
    redirect_to :action => "index"
  end
end

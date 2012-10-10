class Framework::Constants::AddressTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @address_type_filter = AddressTypeFilter.new(params[:address_type_filter])
    @address_types = AddressType.paginate :conditions => @address_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @address_type = AddressType.new
  end



  def create
    @address_type = AddressType.new(params[:address_type])
    if @address_type.save
      flash[:notice] = I18n.t("activeview.flashes.address_type.notices.created")
      redirect_to :action => "edit", :id => @address_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @address_type = AddressType.find(params[:id])
  end



  def update
    @address_type = AddressType.find(params[:id])
    if @address_type.update_attributes(params[:address_type])
      flash[:notice] = I18n.t("activeview.flashes.address_type.notices.updated")
      redirect_to :action => "edit", :id => @address_type.id
    else
      render :action => "edit"
    end
  end

  def enable
    @address_type = AddressType.find(params[:id])
    if @address_type.update_attribute(:enabled, 1)
      flash[:notice] = I18n.t("activeview.flashes.address_type.notices.updated")
      redirect_to :action => :index
    else
      render :action => :index
    end
  end

  def disable
    @address_type = AddressType.find(params[:id])
    if @address_type.update_attribute(:enabled, 0)
      flash[:notice] = I18n.t("activeview.flashes.address_type.notices.updated")
      redirect_to :action => :index
    else
      render :action => :index
    end
  end



  def destroy
    cast_ids_to_i(params).each do |id|
      begin
        AddressType.destroy(cast_ids_to_i(params))
      rescue ActiveRecord::StatementInvalid
        # It's OK, record wasn't deleted due to fk
        flash[:warning] = I18n.t("activeview.flashes.address_type.warnings.skipped")
      end
    end
    flash[:notice] = I18n.t("activeview.flashes.address_type.notices.deleted")
    redirect_to :action => "index"
  end
end

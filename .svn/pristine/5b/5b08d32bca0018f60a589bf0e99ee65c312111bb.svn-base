class Framework::Constants::ContractTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @contract_type_filter = ContractTypeFilter.new(params[:contract_type_filter])
    @contract_types = ContractType.paginate :conditions => @contract_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @contract_type = ContractType.new
  end



  def create
    @contract_type = ContractType.new(params[:contract_type])
    if @contract_type.save
      flash[:notice] = I18n.t("contract_types.flash.notices.created")
      redirect_to :action => "edit", :id => @contract_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @contract_type = ContractType.find(params[:id])
  end



  def update
    @contract_type = ContractType.find(params[:id])
    if @contract_type.update_attributes(params[:contract_type])
      flash[:notice] = I18n.t("contract_types.flash.notices.updated")
      redirect_to :action => "edit", :id => @contract_type.id
    else
      render :action => "edit"
    end
  end



  def destroy
    ContractType.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.contract_type.notices.deleted")
    redirect_to :action => "index"
  end
end

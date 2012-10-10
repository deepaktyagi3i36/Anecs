class Framework::Constants::PaymentTypesController < FrameworkController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @payment_type_filter = PaymentTypeFilter.new(params[:payment_type_filter])
    @payment_types = PaymentType.paginate :conditions => @payment_type_filter.conditions,
      :page => params[:page], :order => @orderby
  end



  def show
  end



  def new
    @payment_type = PaymentType.new
  end



  def create
    @payment_type = PaymentType.new(params[:payment_type])
    if @payment_type.save
      flash[:notice] = I18n.t("activeview.flashes.payment_type.notices.created")
      redirect_to :action => "edit", :id => @payment_type.id
    else
      render :action => "new"
    end
  end


  def edit
    @payment_type = PaymentType.find(params[:id])
  end



  def update
    @payment_type = PaymentType.find(params[:id])
    if @payment_type.update_attributes(params[:payment_type])
      flash[:notice] = I18n.t("activeview.flashes.payment_type.notices.updated")
      redirect_to :action => "edit", :id => @payment_type.id
    else
      render :action => "edit"
    end
  end

  def enable
    @payment_type = PaymentType.find(params[:id])
    if @payment_type.update_attribute(:enabled, 1)
      flash[:notice] = I18n.t("activeview.flashes.payment_type.notices.updated")
      redirect_to :action => :index
    else
      render :action => :index
    end
  end

  def disable
    @payment_type = PaymentType.find(params[:id])
    if @payment_type.update_attribute(:enabled, 0)
      flash[:notice] = I18n.t("activeview.flashes.payment_type.notices.updated")
      redirect_to :back, :id => @payment_type.id
    else
      render :action => :index
    end
  end



  def destroy
    PaymentType.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.payment_type.notices.deleted")
    redirect_to :action => "index"
  end
end

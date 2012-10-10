class Framework::Settings::CurrenciesController < FrameworkController
  #::Rails.logger.error("...")

  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    @currency_filter = CurrencyFilter.new(params[:currency_filter])
    @currencies = Currency.paginate :conditions => @currency_filter.conditions,
      :page => params[:page], :order => @orderby
  end

  def show
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(params[:currency])
    if @currency.save
      flash[:notice] = I18n.t("currencies.flash.notices.created")
      redirect_to :action => "edit", :id => @currency.id
    else
      render :action => "new"
    end
  end

  def edit
    @currency = Currency.find(params[:id])
  end

  def update
    @currency = Currency.find(params[:id])
    if @currency.update_attributes(params[:currency])
      flash[:notice] = I18n.t("currencies.flash.notices.udpated")
      redirect_to :action => "edit", :id => @currency.id
    else
      render :action => "edit"
    end
  end

  def destroy
    Currency.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes. ies.flash.notices.deleted.notices.deleted")
    redirect_to :action => "index"
  end
end

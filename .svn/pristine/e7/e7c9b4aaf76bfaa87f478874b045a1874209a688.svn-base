class Myaccount::Shopping::PaymentsController < MyaccountController
  #::Rails.logger.error("...")



  def index
    # Process sorting
    @orderby = params[:orderby] || "name"

    # Process filtering
    if params[:address_filter]
      @address_filter = AddressFilter.new(params[:address_filter])
      @search = Address.find_by_filter(@address_filter)
      @addresses = @search.paginate :page => params[:page], :order => @orderby
    else
      @address_filter = AddressFilter.new
      @addresses = Address.paginate :page => params[:page], :order => @orderby
    end
  end



  def show
  end



  def new
    @address = Address.new
  end



  def create
    @address = Address.new(params[:address])
    if @address.save
      @notice = "Address was succesfully created."
      render :action => "edit"
    else
      @error = "Address was succesfully created."
    end
  end


  def edit
    @address = Address.find(params[:id])
  end



  def update
    @address = Address.find(params[:id])
    if @address.update_attributes(params[:address])
      @notice = "Address was succesfully updated."
      render :action => "edit"
    else
      @error = "Address wasn't succesfully created."
    end
  end



  def destroy
    Address.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.address.notices.deleted")
    redirect_to :action => "index"
  end

end

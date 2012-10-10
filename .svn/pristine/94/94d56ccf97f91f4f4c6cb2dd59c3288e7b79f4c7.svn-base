class Myaccount::Shopping::AddressesController < MyaccountController
  # ::Rails.logger.error("...")

  # Include filters
  before_filter :load_data



  def index
    # Process sorting
    @orderby = params[:orderby] || 'name'
    @address = Address.new :user_id => @current_user.id
  end



  def show
  end



  def new
    @address = Address.new :user_id => @current_user.id
  end



  def create
    params[:address][:user_id] = @current_user.id
    @address = Address.new(params[:address])
    if @address.save
      flash[:notice] = I18n.t('activeview.flashes.address.notices.created')
      redirect_to :action => :index
    else
      #flash.now[:error] = I18n.t('activeview.flashes.address.errors.not_created')
      render :new
    end
  end


  def edit
    @address = @current_user.addresses.find(params[:id])
  end

  def update
    @address = get_user_address(params[:id])
    if @address.update_attributes(params[:address])
      flash[:notice] = I18n.t('activeview.flashes.address.notices.updated')
      redirect_to :action => :index
    else
      #flash.now[:error] = I18n.t('activeview.flashes.address.errors.not_updated')
      render :edit
    end
  end

  def make_default
    @address = get_user_address(params[:id])
    @address.default = 1
    if @address.save
      flash[:notice] = I18n.t('activeview.flashes.address.notices.updated')
      redirect_to :action => :index
    else
      flash.now[:error] = I18n.t('activeview.flashes.address.errors.not_updated')
      render :edit
    end
  end

  def destroy
    succeeded = true
    errors = []
    cast_ids_to_i(params).each do |id|
      address = get_user_address(id)
      succeeded = address.destroy && succeeded
      if (!succeeded)
        err = address.errors.on_base
        errors << err if !err.nil?
      end
    end
    if succeeded
      flash[:notice] = I18n.t('activeview.flashes.address.notices.deleted')
    else
      if (errors.empty?)
        flash[:error] = I18n.t('activeview.flashes.address.errors.not_deleted')
      else
        flash[:error] = errors
      end
    end
    redirect_to :action => :index
  end

  def get_user_address(id)
    @current_user.addresses.find(id)
  end

  private
  def load_data
    @countries = Country.all
    @address_types = AddressType.find_all_by_enabled(1)
    @shipping_address_type = AddressType.find_by_code('shipping')
    @billing_address_type = AddressType.find_by_code('billing')
    @shipping_addresses = Address.paginate :page => params[:page],
      :conditions => ['user_id = ? and address_type_id = ?', @current_user.id, @shipping_address_type.id],
      :order => @orderby

    if @billing_address_type.enabled == 1
      @billing_addresses = Address.paginate :page => params[:page],
        :conditions => ['user_id = ? and address_type_id = ?', @current_user.id, @billing_address_type.id],
        :order => @orderby
    end
  end
end

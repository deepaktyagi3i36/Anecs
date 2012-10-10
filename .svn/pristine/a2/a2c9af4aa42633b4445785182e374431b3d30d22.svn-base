class Myaccount::Shopping::OrdersController < MyaccountController
  # ::Rails.logger.error("...")

  # Include filters
  before_filter :load_data

  def index
  end

  def show
  end

  def edit
  end

  def update
    if @order.update_attributes(params[:order])
      flash[:notice] = I18n.t('activeview.flashes.order.notices.updated')
      redirect_to :action => "show", :id => @order
    else
      flash.now[:error] = I18n.t('activeview.flashes.order.errors.not_updated')
      render :action => "edit"
    end
  end

  def cancel
    cancelled_state = OrderState.find_by_code('cancelled')
    @order.order_state = cancelled_state
    if @order.save
      Postoffice.order_cancelled_user_notification(@order).deliver
      Postoffice.order_cancelled_sales_notification(@order).deliver
      flash[:notice] = I18n.t('activeview.flashes.order.notices.cancelled')
      redirect_to :action => :index
    else
      flash.now[:error] = I18n.t('activeview.flashes.order.errors.not_cancelled')
      render :action => :index
    end
  end

  def repeat
    missing_variants = @order.get_missing_variants
    if !missing_variants.nil? and missing_variants.size > 0
      @order.destroy
      flash[:error] = I18n.t('activeview.flashes.order.errors.not_repeated') << '. ' <<
        I18n.t('activerecord.errors.models.order.variants_missing', :variants => missing_variants.pretty_inspect)
      redirect_to :back
      return
    end
    Order.check_session_order(get_session_id)
    state = OrderState.find_by_code "inprogress"
    last_id = Order.last ? Order.last.id : 0
    name = format("1%06d", last_id + 1)
    @new_order = Order.new
    @new_order.order_state_id = state.id
    @new_order.name = name
    @new_order.user_id = @current_user.id if logged_in?
    @new_order.session_id = get_session_id
    @new_order.email = @order.email
    @new_order.address_id = @order.address_id
    @new_order.shipping_type_id = @order.shipping_type_id
    @new_order.payment_type_id = @order.payment_type_id
    @new_order.user_name = @order.user_name
    @new_order.notes = @order.notes
    @new_order.total_items = @order.total_items
    @new_order.total_price = @order.actual_total_price
    @new_order.save!

    # Move all items from shopping cart to order
    @order.order_variants.each do |old_variant|
      variant = OrderVariant.new :order_id => @new_order.id
      variant.variant_id = old_variant.variant_id
      variant.product_nm = old_variant.variant.product.name
      variant.variant_nm = old_variant.variant.name
      variant.quantity = old_variant.quantity
      variant.price = old_variant.variant.price
      variant.currency_id = old_variant.variant.currency_id
      variant.save!
    end
    @new_order.next
    redirect_to :controller => '/orders', :action => :edit, :id => @new_order.id
  end

  def destroy
    Order.destroy(cast_ids_to_i(params))
    flash[:notice] = I18n.t("activeview.flashes.order.notices.deleted")
    redirect_to :action => "index"
  end

  private
  def load_data
    @order_states = OrderState.find(:all, :order => "name")
    @shipping_types = ShippingType.find(:all, :conditions => 'enabled = 1', :order => "name")
    @shipping_address_type = AddressType.find_by_code('shipping')
    @shipping_addresses = @current_user.addresses :all,
      :conditions => ['address_type_id = ?', @shipping_address_type.id],
      :order => 'default desc'
    closed_state_id = OrderState.find_by_code('closed').id
    waiting_state_id = OrderState.find_by_code('waiting').id
    cancelled_state_id = OrderState.find_by_code('cancelled').id
    inprogress_state_id = OrderState.find_by_code('inprogress').id
    @orderby = params[:orderby] || {:active => 'name desc', :waiting => 'name desc', :archived => 'name desc'}
    unless params[:orderby].nil?
      @orderby[:active] = params[:orderby][:active] || 'name desc'
      @orderby[:waiting] = params[:orderby][:waiting] || 'name desc'
      @orderby[:archived] = params[:orderby][:archived] || 'name desc'
    end
    @active_orders = @current_user.orders.all :conditions => ['order_state_id != ? and order_state_id != ? and order_state_id != ? and order_state_id != ?',
      closed_state_id, waiting_state_id, cancelled_state_id, inprogress_state_id],
      :include => [:order_state, :address, :order_variants], :order => @orderby[:active]
    @waiting_orders = @current_user.orders.all :conditions => ['order_state_id = ?', waiting_state_id],
      :include => [:order_state, :address, :order_variants], :order => @orderby[:waiting]
    @archived_orders = @current_user.orders.paginate :page => params[:page],
      :conditions => ['order_state_id = ? or order_state_id = ?', closed_state_id, cancelled_state_id],
      :include => [:order_state, :address, :order_variants], :order => @orderby[:archived]
    unless params[:id].nil?
      @order = @current_user.orders.find(params[:id])
      load_child_data
    end
  end

  def load_child_data
    # Process sorting
    column_name = params[:column]
    column_name = "order_variants.variant_nm" if params[:column].nil?
    if params[:orderby] == column_name + " asc"
      @orderby = column_name + " desc"
    else
      @orderby = column_name + " asc"
    end

    # Process filtering
    @order_variants_filter = OrderVariantFilter.new({:order_id => @order.id})
    @order_variants = OrderVariant.paginate :include => [:order, :variant],
      :conditions => @order_variants_filter.conditions, :page => params[:page], :order => @orderby
  end


  def set_breadcrumb
    add_breadcrumb I18n.t('navigation.myaccount.slidemenu.shopping.orders'), '/myaccount/shopping/orders'
  end

end

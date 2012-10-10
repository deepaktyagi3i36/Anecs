class OrdersController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  # TODO: see user model for captcha
  # include CaptchaHelper
  # captchable_actions :track, :track_guest_order, :track_user_order
  # set_captchable TrackingOrder

  before_filter :find_order, :except => [:track, :track_guest_order, :track_user_order, :get_captcha]
  before_filter :load_data, :except => [:track, :track_guest_order, :track_user_order, :get_captcha]

  def index
  end

  def new
    if @cart.buy_now_items.nil? or @cart.buy_now_items.empty?
      flash[:error] = I18n.t('activerecord.errors.models.order.empty_cart')
      redirect_to :back
      return
    end
    Order.check_session_order(get_session_id)
    state = OrderState.find_by_code "inprogress"
    last_id = Order.last ? Order.last.id : 0
    name = format("1%06d", last_id + 1)
    @order = Order.new
    @order.region_id = @region.id
    @order.order_state_id = state.id
    @order.name = name
    @order.user_id = @current_user.id if logged_in?
    @order.session_id = get_session_id
    @order.total_items = @cart.total_buy_now_items
    @order.total_price = @cart.buy_now_price
    @order.save!

    # Move all items from shopping cart to order
    @cart.buy_now_items.each do |item|
      variant = OrderVariant.new :order_id => @order.id
      variant.variant_id = item.variant.id
      variant.product_nm = item.variant.product.name
      variant.variant_nm = item.variant.name
      variant.quantity = item.quantity
      variant.price = item.variant.price
      variant.currency_id = item.variant.currency_id
      variant.save!
    end
    missing_variants = @order.get_missing_variants
    if !missing_variants.nil? and missing_variants.size > 0
      @order.destroy
      flash[:error] = I18n.t('activerecord.errors.models.order.variants_missing',
        :variants => missing_variants.pretty_inspect)
      redirect_to :back
      return
    end
    @order.next
    redirect_to :action => :edit, :id => @order.id
  end


  def edit
    if @order.checkout_state.code != 'completed'
      before_edit = "before_edit_" + @order.checkout_state.code
      send before_edit if private_methods.include?(before_edit)
    else
      redirect_to :action => :show, :id => @order.id
    end
  end


  def update
    if params[:event].has_key?("next")
      before_update = "before_update_" + @order.checkout_state.code
      proceed = true
      proceed = send before_update if private_methods.include?(before_update)
      unless proceed and @order.update_attributes(params[:order]) and @order.next
        flash.now[:error] = I18n.t('activeview.flashes.order.errors.not_updated')
        render :action => :edit, :id => @order.id
        return
      end
      if @order.checkout_state.code != "completed"
        redirect_to :action => :edit, :id => @order.id
      else
        redirect_to :action => :show, :id => @order.id
      end
      return
    end
    if params[:event].has_key?("previous")
      @order.previous
      redirect_to :back and return
    end
    if params[:event].has_key?('create_address')
      @show_new_address = true
      shipping_type_id = AddressType.find_by_code('shipping').id
      @address = Address.new :user_id => @user_id,
        :address_type_id => shipping_type_id
      @addresses = @current_user.addresses.find_all_by_address_type_id(shipping_type_id) if logged_in?
      render :action => :edit, :id => @order.id
    end
  end

  def set_checkout_state
    previous_direction = nil
    while Order.find(@order.id).checkout_state.code != params[:checkout_state]
      order = Order.find(@order.id)
      direction = order.in_state_later_than?(params[:checkout_state]) ? :previous : :next
      if !previous_direction.nil? and !direction.eql?(previous_direction)
        break
      else
        begin
          order.send direction
        rescue Exception => ex
          Rails.logger.error(ex)
          break
        end
        previous_direction = direction
      end
    end
    redirect_to :action => :edit, :id => @order.id
  end

  def track
    init_tracking_order
  end

  def track_guest_order
    @tracking_order = TrackingOrder.new(params[:tracking_order])
    if !@tracking_order.valid?
      # Form is invalid, create a newe captcha key
      render :action => :track and return
    else
      # TODO: implement
    end
  end

  def track_user_order
    @current_user = User.authenticate(params[:tracking_user_order][:login], params[:tracking_user_order][:password])
    if logged_in?
      cookies[:auth_token] = {:value => @current_user.remember_token,
        :expires => @current_user.remember_token_expires_at}
      session[:user_id] = @current_user.id
      flash[:notice] = I18n.t("activeview.flashes.user_session.notices.created")
      redirect_to :controller => '/myaccount/shopping/orders', :action => :index
    else
      init_tracking_order
      @tracking_user_order.errors.add_to_base(I18n.t('activerecord.errors.models.credential.invalid_username_or_password'))
      render :track
    end

  end

  private
  def init_tracking_order
    @tracking_order = TrackingOrder.new()
    @tracking_user_order = TrackingUserOrder.new()
  end

  def find_order
    return
    begin
      @order = Order.find(params[:id]) if !params[:id].nil?
      if @order.nil?
        @order = Order.find(params[:order][:id]) if !params[:order].nil?
      end
    rescue
      raise ActiveRecord::RecordNotFound
    end
    if @order.nil?
      @order = Order.find_by_session_id(get_session_id)
    else
      order_user_id = @order.user_id
      if !order_user_id.nil? and (order_user_id != current_user.id or !logged_in?)
        @order = nil
        Rails.logger.error("An attempt to edit order with id: #{@order.id} which belongs to other user")
      end
    end
    if @order.nil? and action_name != 'new'
      raise ActiveRecord::RecordNotFound
    end
  end

  def load_data
    return
    @countries ||= Country.all
    @address_types ||= AddressType.find_all_by_enabled(1)
    @shipping_types ||= ShippingType.find_all_by_enabled(1)
    @payment_types ||= PaymentType.find_all_by_enabled(1)
    @user_id = @current_user.id if logged_in?
    @states = @order.get_checkout_states if !@order.nil?
  end

  def before_edit_registration
    if !@current_user.nil?
      find_order
      @order.user_id = @current_user.id
      @order.email = @current_user.email
      @order.save
      @order.next
      redirect_to :action => :edit, :id => @order.id
    end
    true
  end

  def before_update_registration
    if params[:registration_type] == 'as_registered_user'
      @current_user = User.authenticate(params[:user][:login], params[:user][:password])
      if logged_in?
        cookies[:auth_token] = {:value => @current_user.remember_token,
          :expires => @current_user.remember_token_expires_at}
        session[:user_id] = @current_user.id
        update_session_content
        flash[:notice] = I18n.t("activeview.user_flashes.user_session.notices.created")
        params[:order][:user_id] = @current_user.id
        true
      else
        @cancelled
        @order.errors.add_to_base(I18n.t('activerecord.errors.models.credential.invalid_username_or_password'))
        return false
      end
    else
      true
    end
  end

  def before_edit_delivery
    if @order.shipping_type_id.nil?
      @shipping_type = ShippingType.find_by_code("courier")
    else
      @shipping_type = ShippingType.find(@order.shipping_type_id)
    end
  end

  def before_edit_address
    if logged_in?
      shipping_type_id = AddressType.find_by_code('shipping')
      @addresses = @current_user.addresses.find_all_by_address_type_id(shipping_type_id)
    end
    if @order.address_id.nil?
      if logged_in?
        @address = @addresses.first { |addr| addr.default == 1 }
        @address ||= Address.new :name => t('activerecord.attributes.address.defaults.name')
      else
        @address = Address.new :name => t('orders.address.title') + ': ' + @order.name
      end
    else
      if logged_in? and @order.address.user_id != @current_user.id
        @order.update_attribute :address_id, nil
        @address = @addresses.first { |addr| addr.default == 1 }
      else
        @address = Address.find(@order.address_id)
      end
    end
  end

  def before_update_address
    if params[:order][:address_id].nil? and !params[:address].nil?
      shipping_type_id = AddressType.find_by_code('shipping')
      params[:address][:name] ||= I18n.t('orders.address.title') << ' ' << @order.name
      @address = Address.new :address_type_id => shipping_type_id, :user_id => @user_id
      @address.attributes = params[:address]
      if !@address.save
        flash.now[:error] = I18n.t('activeview.flashes.address.errors.not_created')
      else
        params[:order][:address_id] = @address.id
      end
    end
    if params[:order][:address_id].nil?
      flash.now[:error] = I18n.t('activerecord.errors.models.order.attributes.address_id.blank')
      return false
    end
    true
  end

  def before_edit_payment
    if @order.payment_type_id.nil?
      @payment_type = PaymentType.find_by_code("cash_to_courier")
    else
      @payment_type = PaymentType.find_by_id(@order.payment_type_id)
    end
  end

end

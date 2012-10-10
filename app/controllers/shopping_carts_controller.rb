class ShoppingCartsController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  def edit
    # If cart is empty, then redirect
    if @cart.total_buy_now_items == 0
      flash[:notice] = I18n.t("activeview.flashes.shopping_cart.warnings.empty_cart")
      redirect_back_or_default(root_path) and return
    end

    # :id is not mandatory, but if id is present
    # then is should be equal to the id of the current cart
    if (!params[:id].nil? && params[:id].to_i != @cart.id)
      raise ActiveRecord::RecordNotFound
    end
    @buy_now_items = @cart.buy_now_items
    @buy_later_items = @cart.buy_later_items
  end

  def update
    @buy_now_items = @cart.buy_now_items
    @buy_later_items = @cart.buy_later_items
    success = true
    if params.include? 'delete_all_buy_now_items'
      success = @cart.delete_all_buy_now_items
    elsif params.include? 'delete_all_buy_later_items'
      success = @cart.delete_all_buy_later_items
    else
      success = @cart.update_attributes(params[:shopping_cart])
    end
    if success
      flash[:notice] = I18n.t('activeview.flashes.shopping_cart.notices.updated')
      redirect_to :action => :edit
    else
      flash[:error] = I18n.t('activeview.flashes.shopping_cart.errors.not_updated')
      render :edit
    end
  end

  def add_to_cart
    item = nil
    if params.has_key?(:variant_id)
      item = CartItem.new({:variant_id =>params[:variant_id], :quantity => 1})
    elsif params.has_key?(:cart_item)
      item = CartItem.new(params[:cart_item])
    end

    # Check that variant_id is selected
    if item.nil? or item.variant_id.nil?
      redirect_to :back
      return
    end

    # Add a new variant to shopping cart and redirect to back
    @cart.add_buy_now_item(item)
    redirect_to :back
  end

end

require 'spec_helper'

describe ShoppingCartsController do
  # ::Rails.logger.error("...")
  render_views

  def setup
    super
    @cart = ShoppingCart.create!
    session[:shopping_cart_id] = @cart.id

    @comparator = Comparator.create!
    session[:comparator_id] = @comparator.id
  end

  it 'should inherit from ApplicationController' do
    assert_kind_of ApplicationController, @controller
  end

  it 'should edit shopping_cart' do
    # we couldn't edit an empty cart
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    post :add_to_cart, {'variant_id' => Variant.find_by_name('with chocolate taste').id}
    get :edit
    assert_response :success
  end

  it 'should update shopping_cart' do
    # TODO: implement
    # get :update
    # assert_response :success
  end

  it 'should redirect back to products after adding item shopping_cart' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    post :add_to_cart, {'variant_id' => Variant.find_by_name('with chocolate taste').id}
    assert_redirected_to :controller => 'products', :action => 'index'
  end

  it 'should increase buy_now_items size' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    assert_difference 'ShoppingCart.find(@cart.id).buy_now_items.size', 2 do
      post :add_to_cart, {'variant_id' => Variant.find_by_name('with chocolate taste').id}
      post :add_to_cart, {'variant_id' => Variant.find_by_name('with banana taste').id}
    end
  end

  it 'shouldn`t increase buy_later_items size' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    assert_no_difference 'ShoppingCart.find(@cart.id).buy_later_items.size' do
      post :add_to_cart, {'variant_id' => Variant.find_by_name('with chocolate taste').id}
    end
  end

  it 'shouldn`t add item if variant_id is nil' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    assert_no_difference 'ShoppingCart.find(@cart.id).buy_now_items.size' do
      post :add_to_cart, {'variant_id' => nil}
    end
  end

#  it 'shouldn`t add item if variant_id doesn't correspond to existing variant' do
#    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
#    assert_raise ActiveRecord::StatementInvalid do
#      post :add_to_cart, 'variant_id' => 9999999
#      @cart.buy_now_items.each do |item|
#      end
#    end
#  end
#
  it 'should increase total items amount' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    post :add_to_cart, 'variant_id' => Variant.find_by_name('with banana taste').id
    variant = Variant.find_by_name('with chocolate taste')
    assert_difference 'ShoppingCart.find(@cart.id).total_items'  do
      post :add_to_cart, 'variant_id' => variant.id
    end
  end

  it 'should increase total price by the price of an added item' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    post :add_to_cart, 'variant_id' => Variant.find_by_name('with banana taste').id
    variant = Variant.find_by_name('with chocolate taste')
    assert_difference 'ShoppingCart.find(@cart.id).total_price', variant.price  do
      post :add_to_cart, 'variant_id' => variant.id
    end
  end

  it 'shopping cart is loaded' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    post :add_to_cart, {'variant_id' => Variant.find_by_name('with chocolate taste').id}
    assert_not_nil @request.session[:shopping_cart_id]
  end

end

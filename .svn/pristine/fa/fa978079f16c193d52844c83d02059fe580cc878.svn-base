require 'spec_helper'

describe ComparatorsController do
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

  it 'should edit comparator' do
    get :edit
    assert_response :success
  end

  it 'should update comparator' do
    # TODO: implement
    # get :update
    # assert_response :success
  end

  it 'should redirect back to products after adding item comparator' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    post :add_to_comparator, {'variant_id' => Variant.find_by_name('with chocolate taste').id}
    assert_redirected_to :controller => 'products', :action => 'index'
  end

  it 'should increase comparator_items size' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    assert_difference 'Comparator.find(@comparator.id).comparator_items.size', 2 do
      post :add_to_comparator, {'variant_id' => Variant.find_by_name('with chocolate taste').id}
      post :add_to_comparator, {'variant_id' => Variant.find_by_name('with banana taste').id}
    end
  end

  it 'shouldn`t add item if variant_id is nil' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    assert_no_difference 'Comparator.find(@comparator.id).comparator_items.size' do
      post :add_to_comparator, {'variant_id' => nil}
    end
  end

  it 'comparator is loaded' do
    @request.env['HTTP_REFERER'] = 'http://' + @request.host_with_port + '/products'
    post :add_to_comparator, {'variant_id' => Variant.find_by_name('with chocolate taste').id}
    assert_not_nil @request.session[:comparator_id]
  end
end

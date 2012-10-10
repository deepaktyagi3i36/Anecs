require 'spec_helper'

describe Myaccount::Shopping::AddressesController, :type=>:controller do
  render_views

  # Activate authlogic
  setup :activate_authlogic

  it 'should inherit from ApplicationController' do
    assert_kind_of ApplicationController, @controller
  end

  it 'should inherit from MyshoppingController' do
    assert_kind_of MyaccountController, @controller
  end

  describe "user not logged in" do
    it "should not GET index" do
      get :index
      assert_redirected_to "/sessions/new"
    end
  end

  describe "user logged in as root" do
    before(:each) do
      UserSession.create(users(:root))
    end

    it 'should get index' do
      get :index
      assert_response :success
    end

    it 'should get index again' do
      get :index
      assert_response :success
    end

    it 'should create address for current user' do
      assert_difference('Address.count') do
        post :create, :address => { :name => 'my home addr', :country_id => countries(:russia_country).to_param,
            :city => 'Spb', :street_address1 => '11, dsdd', :street_address2 => 'ap. 3232',
            :zip => '121211', :phone => '+78123002040',
            :address_type_id => address_types(:shipping_address_type).to_param}
      end
      assert_not_nil flash[:notice]
      assert_equal(session[:user_id], Address.last.user_id)
      assert_redirected_to :action => :index
    end

    it 'should update address of current user' do
      address = Address.first :conditions => ['user_id = ?', session[:user_id]]
      post :update, :id => address.id, :address => {:name => 'New ' << address.name}
      assert_not_nil flash[:notice]
      changed_address = Address.find(address.id)
      assert_not_equal(address.name, changed_address.name)
      assert_redirected_to :action => :index
    end

    it 'shouldn`t update address of other user' do
      address = Address.first :conditions => ['user_id != ?', session[:user_id]]
      assert_raises ActiveRecord::RecordNotFound do
        post :update, :id => address.id, :address => {:name => 'New ' << address.name}
      end
      changed_address = Address.find(address.id)
      assert_equal(address.name, changed_address.name)
    end

    it 'should delete address of current user' do
      address = Address.first :conditions => ['user_id = ?', session[:user_id]]
      assert_difference('Address.count', -1) do
        post :destroy, :id => address.id
      end
      assert_not_nil flash[:notice]
      assert_redirected_to :action => :index
    end

    it 'shouldn`t delete address of other user' do
      address = Address.first :conditions => ['user_id != ?', session[:user_id]]
      assert_raises ActiveRecord::RecordNotFound do
        post :destroy, :id => address.id
      end
      assert_not_nil Address.find(address.id)
    end

    it 'should delete all selected addresses of the current user that aren`t in order'  do
      addresses = Address.all :conditions => ['user_id = ? and not exists(select 1 from orders where orders.address_id = addresses.id)', session[:user_id]]
      assert_difference('Address.count', -addresses.size) do
        post :destroy, :ids => addresses.map {|address| address.id}
      end
      assert_not_nil flash[:notice]
      assert_redirected_to :action => :index
    end


    it 'should make given shipping address default and set other user addresses not default'  do
      shipping_type = AddressType.find_by_code('shipping')
      post :create, :address => { :name => 'my home addr', :country_id => countries(:russia_country).to_param,
            :city => 'Spb', :street_address1 => '11, dsdd', :street_address2 => 'ap. 3232',
            :zip => '121211', :phone => '+78123002040',
            :address_type_id => shipping_type.id}
      id1 = Address.last.id
      post :create, :address => { :name => 'my home addr2', :country_id => countries(:russia_country).to_param,
            :city => 'Spb', :street_address1 => '323, dsdd', :street_address2 => 'ap. 54',
            :zip => '121211', :phone => '030039',
            :address_type_id => shipping_type.id}
      id2 = Address.last.id

      post :make_default, :id => id1
      assert_equal 1, Address.find(id1).default
      assert_equal 0, Address.find(id2).default

      post :make_default, :id => id2
      assert_equal 0, Address.find(id1).default
      assert_equal 1, Address.find(id2).default

      assert_not_nil flash[:notice]
      assert_redirected_to :action => :index
    end
  end
end

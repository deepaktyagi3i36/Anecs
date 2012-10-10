# == Schema Information
#
# Table name: orders
#
#  id                :integer(4)      not null, primary key
#  name              :string(128)     not null
#  namel             :string(128)     not null
#  about             :string(128)
#  order_state_id    :integer(4)      not null
#  user_id           :integer(4)
#  shipping_type_id  :integer(4)
#  payment_type_id   :integer(4)
#  address_id        :integer(4)
#  checkout_state_id :integer(4)      not null
#  email             :string(128)
#  created_at        :datetime
#  updated_at        :datetime
#  session_id        :integer(4)
#  user_name         :string(255)
#  notes             :string(255)
#  total_price       :decimal(10, 2)  not null
#  total_items       :integer(4)      not null
#  shipping_address  :string(1024)
#  website_id        :integer(4)      not null
#  region_id         :integer(4)      not null
#

class Order < ActiveRecord::Base

  attr_accessor :checkout_stage

  belongs_to :website
  belongs_to :user
  belongs_to :address
  belongs_to :region
  belongs_to :order_state
  belongs_to :shipping_type
  belongs_to :payment_type
  belongs_to :checkout_state
  belongs_to :session

  has_many :order_variants, :dependent => :destroy

  before_save :setup_namel
  before_save :update_checkout_state_id
  before_save :update_closed_inventories
  before_destroy :check_destroy_state

  validates_format_of :email, :allow_blank => true, :allow_nil => true, :with => /\w+[\w\.\-]*@[\w\.]+/

  def self.check_session_order(session_id)
    order = Order.find_by_session_id(session_id)
    if !order.nil?
      if order.in_state_later_than?('confirmation')
        order.update_attribute(:session_id, nil) and return
      else
        order.destroy
      end
    end
  end

  def get_missing_variants
    missing_variants = Array.new
    order_variants.each do |order_variant|
      variant = Variant.find(order_variant.variant_id)
      product = Product.find(variant.product_id)
      unless variant.enabled == 1 and product.enabled == 1
        missing_variants << "#{product.name} #{variant.t_name}"
      end
    end
    missing_variants
    #    if missing_variants.size > 0
    #      errors.add_to_base I18n.t('activerecord.errors.models.order.variants_missing', :variants => missing_variants)
    #      return false
    #    end
    #    true
  end

  def checkout_stage
    return @checkout_stage if !@checkout_stage.nil?
    @checkout_stage = CheckoutState.find(self.checkout_state_id).code if !checkout_state_id.nil?
    @checkout_stage
  end

  def is_cancelling_enabled
    order_state.code.eql?('accepted') or order_state.code.eql?('waiting')
  end

  # checkout state machine
  state_machine :attribute => :checkout_stage, :initial => 'started' do
    before_transition :to => 'completed', :do => :complete_order
    before_transition :to => 'confirmation', :do => :update_user_attributes
    before_transition :from => 'registration', :on => :next, :do => :validate_registration
    before_transition :from => 'delivery', :on => :next, :do => :validate_delivery
    before_transition :from => 'address', :on => :next, :do => :validate_address
    before_transition :from => 'payment', :on => :next, :do => :validate_payment
    after_transition :to => 'completed', :do => :notify_order

    event :next do
      transition :from => 'started', :to => 'registration', :unless => :skip_registration?
      transition :from => 'started', :to => 'delivery', :if => :skip_registration_only?
      transition :from => 'started', :to => 'address', :if => :skip_registration_and_delivery?
      transition :from => 'registration', :to => 'delivery', :unless => :skip_delivery?
      transition :from => 'registration', :to => 'address', :if => :skip_delivery?
      transition :from => 'delivery', :to => 'address'
      transition :from => 'address', :to => 'payment', :unless => :skip_payment?
      transition :from => 'address', :to => 'confirmation', :if => :skip_payment?
      transition :from => 'payment', :to => 'confirmation'
      transition :from => 'confirmation', :to => 'completed'
    end

    event :previous do
      transition :from => 'registration', :to => 'started'
      transition :from => 'delivery', :to => 'registration', :unless => :skip_registration?
      transition :from => 'address', :to => 'delivery', :unless => :skip_delivery?
      transition :from => 'address', :to => 'registration', :if => :skip_delivery_only?
      transition :from => 'address', :to => 'started', :if => :skip_registration_and_delivery?
      transition :from => 'payment', :to => 'address'
      transition :from => 'confirmation', :to => 'payment', :unless => :skip_payment?
      transition :from => 'confirmation', :to => 'address', :if => :skip_payment?
    end
  end

  def get_checkout_states
    states = []
    if checkout_state.code == 'started' or checkout_state.code == 'completed'
      return states
    end
    states.push({
        :checkout_state => CheckoutState.find_by_code('registration'),
        :link_enabled => true,
        :current => checkout_state.code == 'registration'}
    ) unless skip_registration?
    states.push({
        :checkout_state => CheckoutState.find_by_code('delivery'),
        :link_enabled => !(email.nil? and user_id.nil?),
        :current => checkout_state.code == 'delivery'}
    ) unless skip_delivery?
    states.push({
        :checkout_state => CheckoutState.find_by_code('address'),
        :link_enabled => (!(email.nil? and user_id.nil?) and !shipping_type_id.nil?),
        :current => checkout_state.code == 'address'}
    )
    states.push({
        :checkout_state => CheckoutState.find_by_code('payment'),
        :link_enabled => !address_id.nil?,
        :current => checkout_state.code == 'payment'}
    ) unless skip_payment?
    states.push({
        :checkout_state => CheckoutState.find_by_code('confirmation'),
        :link_enabled => !(payment_type_id.nil? or address_id.nil? or shipping_type_id.nil?),
        :current => checkout_state.code == 'confirmation'}
    )
    states
  end

  def in_state_later_than?(code)
    current_code = checkout_state.code
    if current_code == 'started'
      false;
    elsif current_code == 'registration'
      code == 'started'
    elsif current_code == 'delivery'
      code == 'registration' or code == 'started'
    elsif current_code == 'address'
      code == 'registration' or code == 'started' or code == 'delivery'
    elsif current_code == 'payment'
      code != 'completed' and code != 'confirmation' and code != 'payment'
    elsif current_code == 'confirmation'
      code != 'completed' and code != 'confirmation'
    elsif current_code == 'completed'
      code != 'completed'
    end
  end

  def valid_state_to_transit?(state)
    checkout_state.code != 'completed' and !state.nil? and
      ['registration', 'delivery', 'address', 'payment', 'confirmation'].include?(state)
  end

  def skip_registration?
    !user_id.nil?
  end

  def skip_delivery?
    shipping_types = ShippingType.find_all_by_enabled(1)
    if shipping_types.size == 1
      if shipping_type_id.nil?
        update_attribute :shipping_type_id, shipping_types.first.id
      end
      true
    else
      false
    end
  end

  def skip_registration_and_delivery?
    skip_registration? && skip_delivery?
  end

  def skip_registration_only?
    skip_registration? && !skip_delivery?
  end

  def skip_delivery_only?
    !skip_registration? && skip_delivery?
  end

  def skip_payment?
    payment_types = PaymentType.find_all_by_enabled(1)
    if payment_types.size == 1
      if payment_type_id.nil?
        update_attribute :payment_type_id, payment_types.first.id
      end
      true
    else
      false
    end
  end

  def has_next?
    checkout_state.code != 'completed'
  end

  def has_previous?
    if checkout_state.code == 'completed' || checkout_state.code == 'registration' || (checkout_state.code == 'delivery' && skip_registration?) || (checkout_state.code == 'address' && skip_registration_and_delivery?)
      false
    else
      true
    end
  end

  def actual_total_price
    price = 0
    order_variants.each do |item|
      variant = Variant.find(item.variant_id)
      price += variant.price * item.quantity
    end
    price
  end

  private
  def validate_registration
    if user_id.nil? and (email.nil? or email.blank?)
      errors.add(:email, I18n.t('activerecord.errors.models.order.attributes.email.blank'))
      false
    end
  end

  def validate_delivery
    if shipping_type_id.nil?
      errors.add(:shipping_type_id, I18n.t('activerecord.errors.models.order.attributes.shipping_type_id.blank'))
    end
  end

  def validate_address
    if user_id.nil? and (user_name.nil? or user_name.blank?)
      errors.add(:user_name, I18n.t('activerecord.errors.models.order.attributes.user_name.blank'))
      false
    end
    if address_id.nil?
      errors.add(:address_id, I18n.t('activerecord.errors.models.order.attributes.address_id.blank'))
    end
  end

  def validate_payment
    if payment_type_id.nil?
      errors.add(:payment_type_id, I18n.t('activerecord.errors.models.order.attributes.payment_type_id.blank'))
    end
  end

  def process_payment
    #TODO
  end

  def update_user_attributes
    if !user_id.nil?
      update_attribute :email, user.email
      update_attribute :user_name, (user.lastname + ' ' + user.firstname + ' ' + (user.middlename || ''))
    end
  end

  def complete_order
    if !session_id.nil?
      if user_id.nil?
        cart = ShoppingCart.find_by_session_id(session_id)
      else
        cart = ShoppingCart.find_by_user_id(user_id)
      end
      order_price = 0
      order_total = 0
      order_variants.each do |order_variant|
        item = cart.cart_items.find :first, :conditions => ['variant_id = ? and saved_for_later = 0', order_variant.variant_id]
        order_price += order_variant.price
        order_total += order_variant.quantity
        item.delete if !item.nil?
      end
      self.session_id = nil
      self.order_state = OrderState.find_by_code('accepted')
      self.shipping_address = Address.find(address_id).full_name
      self.about = I18n.t('orders.name') + name + ', ' + I18n.t('orders.total_items') + ': ' + order_total.to_s +
        ', ' + I18n.t('orders.total_price') + ': ' + order_price.to_s + ', ' + I18n.t('orders.address.user_name') +
        ': ' + user_name
      save
    end
  end

  def notify_order
    Postoffice.order_confirmed_user_notification(self).deliver
    Postoffice.order_confirmed_sales_notification(self).deliver
  end

  def setup_namel
    self.namel = UnicodeUtils.downcase(name)
  end

  def update_checkout_state_id
    self.checkout_state_id = CheckoutState.find_by_code(@checkout_stage).id if !@checkout_stage.nil?
  end

  def check_destroy_state
    if in_state_later_than?('confirmation') and order_state.code != 'closed'
      errors.add_to_base(I18n.t('activerecord.errors.models.order.deletion_prohibited'))
      false
    end
  end

  def update_closed_inventories
    next_state = OrderState.find(order_state_id).code
    return unless next_state.eql?('closed') or next_state.eql?('delivery')
    previous_state = Order.find(id).order_state.code
    unless previous_state.eql?('closed') or previous_state.eql?('delivery')
      order_variants.each do |order_variant|
        Variant.find(order_variant.variant_id).inventories.each do |inv|
          if inv.storehouse.region_id == region_id
            inv.quantity = inv.quantity - order_variant.quantity
            inv.save
            if inv.quantity < 5
              Postoffice.out_of_stocks_notification(inv).deliver
            end
          end
        end
      end
    end
  end

end

# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  session_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  website_id :integer(4)      not null
#

class ShoppingCart < ActiveRecord::Base
  # ::Rails.logger.error("...")

  liquid_methods :buy_now_items,:buy_later_items,:total_items,:total_buy_now_items,:total_buy_later_items,:total_price, :buy_now_price, :buy_later_price ,:add_buy_now_item ,:cart_items_attributes= ,:save_items
  belongs_to :website
  belongs_to :user
  belongs_to :session
  has_many :cart_items, :dependent => :delete_all
  
  validates_uniqueness_of :user_id, :allow_nil => true
  validates_associated :cart_items

  after_save :save_items
  
  
  def buy_now_items
    cart_items.find_all {|cart_item| cart_item.saved_for_later == 0}
  end

  def buy_later_items
    cart_items.find_all {|cart_item| cart_item.saved_for_later == 1}
  end

  #
  # Methods to total items in the shopping cart
  # TODO: use cache for this?
  def total_items
    total_buy_now_items + total_buy_later_items
  end

  #
  # Methods to total items in the shopping cart
  # TODO: use cache for this?
  def total_buy_now_items
    total = 0
    buy_now_items.each do |item|
      total += item.quantity
    end
    total
  end

  #
  # Methods to total items in the shopping cart
  # TODO: use cache for this?
  def total_buy_later_items
    total = 0
    buy_later_items.each do |item|
      total += item.quantity
    end
    total
  end

  #
  # Methods to total prices in the shopping cart
  # TODO: use cache for this?
  def total_price
    buy_now_price + buy_later_price
  end

  #
  def buy_now_price
    price = 0
    buy_now_items.each do |item|
      variant = Variant.find(item.variant_id)
      price += variant.price * item.quantity
    end
    price
  end

  def buy_later_price
    price = 0
    buy_later_items.each do |item|
      variant = Variant.find(item.variant_id)
      price += variant.price * item.quantity
    end
    price
  end

  def add_buy_now_item(buy_now_item)
    item = cart_items.find :first, :conditions => ["saved_for_later = 0 and variant_id = ?", buy_now_item.variant_id]
    if item.nil?
      CartItem.create! :shopping_cart_id => id, :variant_id => buy_now_item.variant_id,
          :quantity => buy_now_item.quantity, :saved_for_later => 0
    else
      item.quantity += buy_now_item.quantity
      item.save!
    end
  end

  def cart_items_attributes=(items_attributes)
    cart_items.each do |cart_item|
      attributes = items_attributes[cart_item.id.to_s]
      if attributes
        attributes.delete 'id'
        if attributes.include? '_destroy'
          cart_item.delete
        else
          if attributes.include? 'saved_for_later'
            attributes['saved_for_later'] = 1 - cart_item.saved_for_later
          end
          cart_item.attributes = attributes
          same_variant_item = cart_items.find :first, :conditions => ["saved_for_later = ? and variant_id = ? and id <> ?",
              cart_item.saved_for_later, cart_item.variant_id, cart_item.id]
          unless same_variant_item.nil?
            cart_item.quantity += same_variant_item.quantity
            same_variant_item.delete
          end
        end
      end
    end
  end

  def delete_all_buy_now_items
    buy_now_items.each do |cart_item|
      cart_item.delete
    end
  end

  def delete_all_buy_later_items
    buy_later_items.each do |cart_item|
      cart_item.delete
    end
  end

  def save_items
    cart_items.each do |cart_item|
      cart_item.save(false)
    end
  end

end

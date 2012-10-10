# == Schema Information
#
# Table name: addresses
#
#  id              :integer(4)      not null, primary key
#  name            :string(128)     not null
#  address_type_id :integer(4)
#  user_id         :integer(4)
#  full_name       :string(1024)    not null
#  phone           :string(32)      not null
#  extra_phone     :string(32)
#  street_address1 :string(128)     not null
#  street_address2 :string(128)
#  city            :string(128)     not null
#  country_id      :integer(4)      not null
#  zip             :string(16)
#  created_at      :datetime
#  updated_at      :datetime
#  default         :integer(4)      default(0), not null
#

class Address < ActiveRecord::Base
  belongs_to :address_type
  belongs_to :user
  belongs_to :country
  has_many :orders

  validates_presence_of :name, :address_type, :country, :city, :street_address1
  validates_format_of :phone, :with => /\A[\+\- \(\)\d]+\Z/
  validates_format_of :extra_phone, :with => /\A[\+\- \(\)\d]+\Z/, :allow_blank => true
  validates_numericality_of :default, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1, :only_integer => true

  before_save :setup_full_name, :setup_default
  before_destroy :check_in_orders, :check_default

  private
  #
  # TODO: use configurable pattern for full_name construction from address parts
  def setup_full_name
    self.full_name = "#{country.name}, #{city}, " <<
      "#{street_address1}#{', ' << street_address2 if !(street_address2.nil? or street_address2.blank?)}" <<
      "#{', ' << zip if !(zip.nil? or zip.blank?)}, " <<
      "#{phone} #{' / ' << extra_phone if !(extra_phone.nil? or extra_phone.blank?)}"
  end

  def setup_default
    return if user_id.nil?
    if default == 0
      if  user.addresses.find_all_by_address_type_id(address_type_id).size == 0
        self.default = 1
      end
    else
      user.addresses.find_all_by_address_type_id(address_type_id).each do |addr|
        unless addr.id == id
          addr.update_attribute(:default, 0)
        end
      end
    end
  end

  def check_in_orders
    orders.each do |order|
      if order.order_state.code == 'closed'
        order.update_attribute :address_id, nil
      else
        errors.add_to_base I18n.t('activerecord.errors.models.address.address_in_not_closed_order_couldnt_be_deleted',
          :order_no => order.name)
        return false
      end
    end
  end

  def check_default
    if default == 1
      addresses =  user.addresses.all :conditions => ['address_type_id = ? and id <> ?', address_type_id, id]
      if addresses.count > 0
        addr = addresses.first
        addr.update_attribute :default, 1
      end
    end
  end
end

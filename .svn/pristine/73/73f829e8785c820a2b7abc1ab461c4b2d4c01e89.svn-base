# == Schema Information
#
# Table name: tableless31_models
#
#  email   :string
#  invoice :string
#

class TrackingOrder < Tableless31Model
  # ::Rails.logger.error("...")

  column :email, :string
  column :invoice, :string

  validates_presence_of :email
  validates_presence_of :invoice
  validates_length_of :email,:within => 3..100
  validates_length_of :invoice,:within => 3..100

end

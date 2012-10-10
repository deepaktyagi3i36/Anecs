# == Schema Information
#
# Table name: tableless31_models
#
#  email :string
#

class Email < Tableless31Model
  # ::Rails.logger.error("...")

  column :email, :string

  validates_presence_of :email
  validates_length_of :email,    :within => 3..100
end

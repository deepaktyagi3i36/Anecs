# == Schema Information
#
# Table name: tableless31_models
#
#  password              :string
#  password_confirmation :string
#

class Password < Tableless31Model
  # ::Rails.logger.error("...")

  column :password, :string
  column :password_confirmation, :string

  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates_length_of :password, :within => 4..40
  validates_confirmation_of :password
end

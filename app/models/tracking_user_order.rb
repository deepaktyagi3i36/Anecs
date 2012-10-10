# == Schema Information
#
# Table name: tableless31_models
#
#  login    :string
#  password :string
#

class TrackingUserOrder < Tableless31Model
  # ::Rails.logger.error("...")

  column :login, :string
  column :password, :string

  validates_presence_of :login
  validates_presence_of :password
  validates_length_of :login,:within => 3..40
  validates_length_of :password,:within => 3..40

end

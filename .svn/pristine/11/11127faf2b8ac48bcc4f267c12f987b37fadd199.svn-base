# == Schema Information
#
# Table name: tableless31_models
#
#  login       :string
#  password    :string
#  remember_me :string
#

class Credential < Tableless31Model
  # ::Rails.logger.error("...")

  column :login, :string
  column :password, :string
  column :remember_me, :string

  validates_presence_of :login
  validates_presence_of :password
  validates_length_of :password, :within => 4..40
end

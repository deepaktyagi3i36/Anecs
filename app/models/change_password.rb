# == Schema Information
#
# Table name: tableless31_models
#
#  login                 :string
#  old_password          :string
#  password              :string
#  password_confirmation :string
#

class ChangePassword < Tableless31Model
  # ::Rails.logger.error("...")

  column :login, :string
  column :old_password, :string
  column :password, :string
  column :password_confirmation, :string

  validates_presence_of :login
  validates_presence_of :old_password
  validates_presence_of :password
  validates_presence_of :password_confirmation

  validates_length_of :login, :within => 1..128
  validates_length_of :old_password, :within => 4..40
  validates_length_of :password, :within => 4..40

  validates_confirmation_of :password

  validate :validate_old_password

  def validate_old_password
    session = UserSession.new(:login => login, :password => old_password)
    if session.nil? || !session.valid?
      errors.add(:old_password)
      false
    end
  end
end


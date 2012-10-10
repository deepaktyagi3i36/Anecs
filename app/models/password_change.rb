class PasswordChange < Password
  # ::Rails.logger.error("...")

  attr_accessor :old_password, :login

  validates_presence_of :old_password
  validates_length_of :old_password, :within => 4..40
  validate :validate_old_password

  def validate_old_password
    if User.authenticate(login, old_password).nil?
      errors.add(:old_password)
      false
    end
  end
end
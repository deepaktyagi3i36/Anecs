# == Schema Information
#
# Table name: privacy_values
#
#  id         :integer(4)      not null, primary key
#  name       :string(128)     not null
#  code       :string(128)     not null
#  about      :string(128)     not null
#  created_at :datetime
#  updated_at :datetime
#

class PrivacyValue < ActiveRecord::Base
end

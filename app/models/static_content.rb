# == Schema Information
#
# Table name: static_contents
#
#  id             :integer(4)      not null, primary key
#  website_id     :integer(4)      not null
#  change_freq_id :integer(4)      not null
#  pageurl        :string(255)     not null
#  about          :string(255)
#  priority       :decimal(10, 2)  default(0.5), not null
#  lastmod        :datetime        default(2012-01-22 04:29:48 +0400), not null
#  enabled        :integer(4)      default(1), not null
#  created_at     :datetime
#  updated_at     :datetime
#

class StaticContent < ActiveRecord::Base
end

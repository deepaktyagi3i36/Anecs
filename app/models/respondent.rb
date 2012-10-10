# == Schema Information
#
# Table name: respondents
#
#  id         :integer(4)      not null, primary key
#  polling_id :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Respondent < ActiveRecord::Base

end

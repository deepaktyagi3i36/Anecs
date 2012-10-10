# == Schema Information
#
# Table name: settings
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)      not null
#  option_id  :integer(4)      not null
#  created_at :datetime
#  updated_at :datetime
#

# = Entity description
#
# WillPaginate adds +paginate+, +per_page+ and other methods to
#
# == Examples
#
# In ActiveRecord finders, <tt>:order</tt> parameter specifies columns for
# PostgreSQL.
#
class Setting < ActiveRecord::Base

end

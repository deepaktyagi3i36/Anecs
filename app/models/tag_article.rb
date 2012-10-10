# == Schema Information
#
# Table name: tag_articles
#
#  id         :integer(4)      not null, primary key
#  tag_id     :integer(4)      not null
#  article_id :integer(4)      not null
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
class TagArticle < ActiveRecord::Base
end

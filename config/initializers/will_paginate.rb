# Configure plugin
DEFAULT_PER_PAGE = 10
WillPaginate::ViewHelpers.pagination_options[:inner_window] = 1

# Line are commented due to button localization, see application_helper
#WillPaginate::ViewHelpers.pagination_options[:next_label] =  "&laquo; Next"
#WillPaginate::ViewHelpers.pagination_options[:previous_label] = "Previous &raquo;"

# Configure for model based
if defined?(ActiveRecord)
 # Set global per page value for models
 class ActiveRecord::Base
   def self.per_page
     DEFAULT_PER_PAGE
   end
 end
end

# Configure for array based
Array.class_eval do
  def paginate(options = {})
    raise ArgumentError, "parameter hash expected (got #{options.inspect})" unless Hash === options
    WillPaginate::Collection.create(
      options[:page] || 1,
      options[:per_page] || DEFAULT_PER_PAGE,
      options[:total_entries] || self.length
    ) { |pager|
        pager.replace self[pager.offset, pager.per_page].to_a
      }
  end
end

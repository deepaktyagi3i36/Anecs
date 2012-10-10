class Framework2lController < ApplicationController
  # ::Rails.logger.error("...")
  layout "framework2l"

  # Include extra helpers
  helper 'framework'
  #helper 'mywellness/myshopping'

  # Include filters
  before_filter :require_user
  before_filter :add_breadcrumbs_by_path

end

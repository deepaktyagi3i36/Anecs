class BackofficeController < ApplicationController
  # ::Rails.logger.error("...")
  layout "backoffice"

  # Include extra helpers
  helper 'backoffice'
  #helper 'mywellness/myshopping'

  # Include filters
  before_filter :require_user
  before_filter :require_website
  before_filter :add_breadcrumbs_by_path

end

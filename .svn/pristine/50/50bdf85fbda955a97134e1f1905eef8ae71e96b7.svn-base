class MyaccountController < ApplicationController
  # ::Rails.logger.error("...")
  layout "myaccount"

  # Include extra helpers
  helper 'myaccount'
  #helper 'mywellness/myshopping'

  # Include filters
  before_filter :require_user
  before_filter :add_breadcrumbs_by_path

end

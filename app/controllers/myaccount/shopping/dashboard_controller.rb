class Myaccount::Shopping::DashboardController < MyaccountController
  # ::Rails.logger.error("...")

  # Include filters
  before_filter :load_data

  def index
  end

  private
  def load_data
    incomplete_order_state_id = OrderState.find_by_code('inprogress').id
    @last_order = @current_user.orders.last :conditions => ['order_state_id != ?', incomplete_order_state_id]
  end

end

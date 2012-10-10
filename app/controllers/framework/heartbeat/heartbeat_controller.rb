class Framework::Heartbeat::HeartbeatController < FrameworkController
  #::Rails.logger.error("...")



  def index
    @sessions_count = Session.count
    @shopping_carts_count = ShoppingCart.count
    @comparators_count = Comparator.count
    @admin_job_reports_count = AdminJobReport.count
  end
end

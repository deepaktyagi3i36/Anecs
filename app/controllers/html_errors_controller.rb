class HtmlErrorsController < ApplicationController
  # ::Rails.logger.error("...")
  layout "greetings"

  if ::Rails.env == 'development'
    def test_exception_404
      raise ActiveRecord::RecordNotFound
    end

    def test_exception_500
      raise 'Testing, 1 2 3.'
    end
  end

  def page404
    render :action => 'page404', :status => 404
  end

  def page422
    render :action => 'page422', :status => 422
  end

  def page500
    render :action => 'page404', :status => 404
  end

  # This is temporary soloution, see url below for details
  # http://torqueo.net/handling-action-controller-routing-error-in-rails-3/
  def noroute
    # Catch all other routes as no route error
    path =  (env["UNA_INFO"] ? env["UNA_INFO"] : env["PATH_INFO"])
    raise ActionController::RoutingError.new(path)
  end
end



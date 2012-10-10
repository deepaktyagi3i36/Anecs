
# http://www.royvandermeij.com/blog/2011/09/21/create-a-liquid-handler-for-rails-3-dot-1/

class ActionView::Template::Handlers::Liquid
  def self.call(template)
    "ActionView::Template::Handlers::Liquid.new(self).render(#{template.source.inspect}, local_assigns)"
  end

  def initialize(view)
    @view = view
  end

  def render(template, local_assigns = {})
    @view.controller.headers["Content-Type"] ||= 'text/html; charset=utf-8'
    @view.controller.headers["Content-Type"] ||= 'text/html; charset=utf-8'

    assigns = @view.assigns

    if @view.content_for?(:layout)
      assigns["content_for_layout"] = @view.content_for(:layout)
    end
    
    
    assigns.merge!(local_assigns.stringify_keys)

    filters = [ActionView::Helpers::UrlHelper,ActionView::Context, ActionView::Helpers::NumberHelper ,ActionView::Helpers::TagHelper, ApplicationHelper, LiquidHelper]
    liquid = Liquid::Template.parse(template)
    liquid.render(assigns, :filters => filters, :registers => {:action_view => @view, :controller => @view.controller})
  end

  def compilable?
    false
  end

end


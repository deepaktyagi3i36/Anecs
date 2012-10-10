# http://www.royvandermeij.com/blog/2011/09/21/create-a-liquid-handler-for-rails-3-dot-1/
require 'action_view/template/handlers/liquid_helper'
require 'action_view/template/handlers/liquid'
ActionView::Template.register_template_handler :liquid,
ActionView::Template::Handlers::Liquid
  
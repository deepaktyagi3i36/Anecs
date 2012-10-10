module AbstractController
  class Base
    def process(action, *args)
      @_action_name = action_name = action.to_s

      unless action_name = method_for_action(action_name)
        env["UNA_INFO"] = env["PATH_INFO"]
        env["PATH_INFO"] = env["REQUEST_URI"] = "/html_errors"
        headers['X-Cascade'] = 'pass'
      end

      action_name = "no_method_handler" unless action_name
      process_action(action_name, *args)
    end
  end
end

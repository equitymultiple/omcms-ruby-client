module OMCMS
  class ParseResponse
    def initialize app
      @app = app
    end

    def call request_env
      @app.call(request_env).on_complete do |response_env|
        if response_env.status >= 400
          return OMCMS::Response::Error.new(response_env)
        else
          return response_env.body
        end
      end
    end
  end
end

module OMCMS
  class SetHeader
    HEADERS = {
      :"user-agent" => "omcms/ruby/client/#{VERSION}"
    }

    def initialize app
      @app = app
    end

    def call request_env
      request_env[:request_headers].merge! HEADERS
      @app.call(request_env)
    end
  end
end

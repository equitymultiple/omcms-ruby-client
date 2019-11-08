module OMCMS
  class Resource
    def initialize(client, response = {}, host = nil)
      @client = client
      @host = host
    end

    private

    def response_class(name)
      Kernel.const_get("OMCMS::Response::#{name}")
    end

    def perform_run(instance, path)
      request_url = [@host, "api", "apps", path].compact.join("/")
      class_name = instance.class.name.split("::").last
      response = @client.get request_url

      return response if response.class == OMCMS::Response::Error
      response_class(class_name).new(@client, response, @host)
    end
  end
end

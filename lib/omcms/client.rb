module OMCMS
  class Client
    attr_reader :client, :offerings

    def initialize(opts)
      configure_credentials(opts)
      configure_client
      configure_resources
    end

    def faraday &block
      @faraday = block if block
      @faraday
    end

    def configure_client
      @client ||= Faraday.new do |f|
        f.request :basic_auth, @username, @password
        f.use SetHeader
        f.use ParseResponse
        f.response :json, :content_type => /\bjson$/
        faraday.call(f) if faraday
        f.adapter Faraday.default_adapter unless faraday
      end
    end

    def configure_resources
      @offerings = OMCMS::Offering.new(@client, @response, @env)
    end

    private

    def configure_credentials(opts)
      raise ArgumentError.new "Couldn't find credentials" if opts[:public_key].empty? || opts[:private_key].empty?
      raise ArgumentError.new "Invalid application environment" unless API_URL.has_key? opts[:env]

      @username = opts[:public_key]
      @password = opts[:private_key]
      @env = opts[:env]
    end
  end
end
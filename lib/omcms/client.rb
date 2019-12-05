module OMCMS
  class Client
    attr_reader :client

    def initialize(opts)
      configure_credentials(opts)
      configure_client
    end

    def faraday &block
      @faraday = block if block
      @faraday
    end

    def configure_client
      @client ||= Faraday.new do |f|
        f.request :basic_auth, @username, @password
        f.options[:open_timeout] = 2
        f.options[:timeout] = 5
        f.use SetHeader
        f.use ParseResponse
        f.response :json, :content_type => /\bjson$/
        faraday.call(f) if faraday
        f.adapter Faraday.default_adapter unless faraday
      end
    end

    def offerings
      OMCMS::Offering.new(@client, @response, @host)
    end

    private

    def configure_credentials(opts)
      raise ArgumentError.new "Public Key is missing for the OMCMS client" if opts[:public_key].to_s.empty?
      raise ArgumentError.new "Private Key is missing for the OMCMS client" if opts[:private_key].to_s.empty?
      raise ArgumentError.new "Host is missing for the OMCMS client" if opts[:host].to_s.empty?

      @username = opts[:public_key]
      @password = opts[:private_key]
      @host = opts[:host]
    end
  end
end
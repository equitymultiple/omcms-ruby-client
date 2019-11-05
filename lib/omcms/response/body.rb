module OMCMS
  module Response
    class Body
      attr_reader :body

      def initialize(client, response, env)
        @client = client
        @body = response
        @env = env
      end

      def to_json
        parse(@body)
      end

      private

      def parse(data = "")
        if data.class == Hash
          return data.keys.map do |attribute|
            key = snakecase(attribute)
            [key, parse(data[attribute])]
          end.to_h
        elsif data.class == Array
          return data.map do |object|
            hash = object.keys.map do |attribute|
              key = snakecase(attribute)
              [key, parse(object[attribute])]
            end.to_h
          end
        end
        return data
      end


      def snakecase(data = "")
        data.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
            .gsub(/([a-z\d])([A-Z])/,'\1_\2')
            .tr('-', '_')
            .gsub(/\s/, '_')
            .gsub(/__+/, '_')
            .downcase
      end
    end
  end
end

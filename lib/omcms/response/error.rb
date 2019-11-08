module OMCMS
  module Response
    class Error < StandardError
      attr_reader :status

      def initialize response
        return unless response
        unless response.respond_to? :body
          response = add_body_to_error(response)
        end

        response.body.each do |key, value|
          instance_variable_set("@#{key}", value)
          self.class.send(:attr_reader, key)
        end
      end

      def to_json
        self.instance_variables.map do |attribute|
          key = attribute.to_s.gsub('@','')
          [snakecase(key), self.instance_variable_get(attribute)]
        end.to_h
      end

      private

      def add_body_to_error(response)
        OpenStruct.new(
          body: {
            statusCode: 400,
            name: "Bad Request",
            message: response
          }
        )
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

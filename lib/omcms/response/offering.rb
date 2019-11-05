module OMCMS
  module Response
    class Offering < Body
      def initialize(client, data, env)
        super
      end

      def components
        OMCMS::Component.new(@client, self.body, @env)
      end

      def data
        OMCMS::OfferingData.new(@client, self.body, @env)
      end
    end
  end
end

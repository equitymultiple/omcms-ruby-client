module OMCMS
  module Response
    class Offering < Body
      def initialize(client, data, host)
        super
      end

      def components
        OMCMS::Component.new(@client, self.body, @host)
      end

      def data
        OMCMS::OfferingData.new(@client, self.body, @host)
      end
    end
  end
end

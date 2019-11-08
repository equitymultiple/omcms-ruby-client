module OMCMS
  class Offering < Resource
    def initialize(client, response, host)
      super
    end

    def all
      perform_run self, request_path()
    end

    def find(id)
      perform_run self, request_path(id)
    end

    private

    def request_path(key = nil)
      ["offerings", key].compact.join("/")
    end
  end
end

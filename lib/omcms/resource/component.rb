module OMCMS
  class Component < Resource
    def initialize(client, response = {}, host)
      @offering_id = response["id"]
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
      ["offerings", @offering_id, "components", key].compact.join("/")
    end
  end
end

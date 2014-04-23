module Topics
  class DisplayTopics
    attr_defaultable :reader_factory, -> { Repositories::Reads::ReadTopics }

    def call(&block)
      yield ResponsiveService::Response.new(:success, '', results)
    end

    private

    def results
      reader_factory.new({}).call
    end
  end
end

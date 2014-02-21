module Topics
  class IndexAction
    attr_writer :reader_factory

    def call(&block)
      yield ResponsiveService::Response.new(:success, '', results)
    end

    def reader_factory
      @reader_factory ||= Repositories::Reads::ReadTopics
    end

    private
    def results
      reader_factory.new({}).call
    end

  end
end
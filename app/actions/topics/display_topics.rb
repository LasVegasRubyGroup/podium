module Topics
  class DisplayTopics < ResponseState::Service
    attr_defaultable :reader_factory, -> { CrudServices::Topics::Read }

    def call(&block)
      yield send_state :success, '', results
    end

    private

    def results
      reader_factory.new({}).call
    end
  end
end

class TopicsController < ApplicationController

  def index
    Topics::IndexAction.new.call do |response|
      response.success { @topics = response.context }
    end
  end

end

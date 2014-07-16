require 'models_spec_helper'

describe Topic do
  subject(:topic) { Topic.new}

  it 'has a record count' do
    n = Topic.count
    expect(n).not_to be_nil
  end

  describe 'create' do

    it 'builds a new topic' do
      expect(topic).not_to be_nil
    end
    
    it 'creates a record in the topics table' do
      n = Topic.count
      Crud::Topics::Create.new(topic.attributes).call
      expect(Topic.count).to eq(n+1)
    end

    it 'creates a record in the current_topics tables' do
      n = CurrentTopic.count
      Crud::Topics::Create.new(topic.attributes).call
      expect(CurrentTopic.count).to eq(n+1)
    end

  end

  # describe '#created' do
  #   context 'when created has been set' do
  #     let(:earlier) { Time.new(2014, 1, 1) }
  #     before { topic.created = earlier }

  #     it 'returns created' do
  #       expect(topic.created).to eq earlier
  #     end
  #   end

  #   context 'when created has not been set' do
  #     let(:now) { Time.now }
  #     before { topic.created_at = now }

  #     it 'returns created_at' do
  #       expect(topic.created).to eq now
  #     end
  #   end
  # end

  # describe '#updated' do
  #   let(:now) { Time.now }
  #   before { topic.created_at = now }

  #   it 'returns created_at' do
  #     expect(topic.updated).to eq now
  #   end
  # end
end

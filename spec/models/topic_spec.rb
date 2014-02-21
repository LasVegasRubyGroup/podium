require 'model_spec_helper'

describe Topic do
  subject(:topic) { Topic.new }

  describe '#created' do
    context 'when created has been set' do
      let(:earlier) { Time.new(2014, 1, 1) }
      before { topic.created = earlier }

      it 'returns created' do
        expect(topic.created).to eq earlier
      end
    end

    context 'when created has not been set' do
      let(:now) { Time.now }
      before { topic.created_at = now }

      it 'returns created_at' do
        expect(topic.created).to eq now
      end
    end
  end

  describe '#updated' do
    let(:now) { Time.now }
    before { topic.created_at = now }

    it 'returns created_at' do
      expect(topic.updated).to eq now
    end
  end
end

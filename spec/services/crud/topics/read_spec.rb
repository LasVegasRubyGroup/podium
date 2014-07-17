require 'services_spec_helper'

RSpec.configure do |config|
  config.filter_run_excluding needs_review: true
end

module Crud
  module Topics 
    describe Read, needs_review: true do 
      subject(:service) { Read.new(filters) }
      let(:filters) { {} }
      let(:resource_collection) { double :resource_collection, where: nil }

      before do
        service.resource_collection = resource_collection
      end

      describe '#call' do
        context 'with no topics in the system matching the filters' do
          before { resource_collection.stub(:where).with({}).and_return([]) }

          it 'returns an empty array' do            
            expect(service.call).to eq []
          end
        end

        context 'with a topic in the system matching the filters' do
          let(:topic) { double :topic, uuid: '1', created_at: Time.new(2014, 1, 1), updated_at: Time.new(2014, 1, 1), :created= => nil, deleted: false }
          before { resource_collection.stub(:where).with({}).and_return([topic]) }

          it 'returns an array with the matching topic' do
            expect(service.call).to eq [topic]
          end
        end

        context 'with two different versions of the same topic in the system matching the filters' do
          let(:topic_v1) { double :topic, uuid: '1', created_at: Time.new(2014, 1, 1), updated_at: Time.new(2014, 1, 1), :created= => nil, deleted: false }
          let(:topic_v2) { double :topic, uuid: '1', created_at: Time.new(2014, 2, 2), updated_at: Time.new(2014, 2, 2), :created= => nil, deleted: deleted }
          let(:deleted) { false }
          before { resource_collection.stub(:where).with({}).and_return([topic_v1, topic_v2]) }

          it 'returns an array with the latest version of the topic' do
            expect(service.call).to eq [topic_v2]
          end

          it 'sets the created on the second version to the created_at of the first version' do
            service.call
            expect(topic_v2).to have_received(:created=).with(topic_v1.created_at)
          end

          context 'with the latest version marked deleted' do
            let(:deleted) { true }

            it 'returns an empty array' do
              expect(service.call).to eq []
            end
          end
        end
      end
    end
  end
end
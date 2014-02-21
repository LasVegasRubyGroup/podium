require 'fast_spec_helper'

module Repositories
  module Creates
    describe CreateTopic do
      subject(:service) { CreateTopic.new(parameters) }
      let(:parameters) { {} }
      let(:internal_parameters) { { uuid: uuid } }
      let(:resource_factory) { double :resource_factory, create: nil }
      let(:uuid_generator) { double :uuid_generator, uuid: uuid }
      let(:uuid) { '12345' }
      let(:topic) { double :topic }

      before do
        service.resource_factory = resource_factory
        service.uuid_generator = uuid_generator
      end

      describe '#call' do
        it 'creates a topic with the factory' do
          service.call
          expect(resource_factory).to have_received(:create).with(internal_parameters)
        end

        it 'returns a topic' do
          expect(resource_factory).to receive(:create).with(internal_parameters).and_return(topic)
          expect(service.call).to eq topic
        end
      end
    end
  end
end
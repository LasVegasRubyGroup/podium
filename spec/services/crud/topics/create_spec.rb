require 'services_spec_helper'

module Crud
  module Topics
    describe Create do
      subject(:service) { Create.new(parameters) }
      let(:parameters) { {} }
      let(:internal_parameters) { { uuid: uuid, ext_id: ext_id } }
      let(:resource_factory) { double :resource_factory, create!: topic}
      let(:extension_resource_factory) { double :extension_resource_factory, create!: ext_topic}
      let(:uuid_generator) { double :uuid_generator, uuid: uuid }
      let(:uuid) { '12345' }
      let(:ext_topic) { double :ext_topic, attributes: {'id' => ext_id} }
      let(:topic) { double :topic}
      let(:ext_id) {'42'}

      before do
        service.resource_factory = resource_factory
        service.extension_resource_factory = extension_resource_factory
        service.uuid_generator = uuid_generator
      end

      describe '#call' do
        it 'creates a topic with the factory' do
          service.call
          expect(extension_resource_factory).to have_received(:create!).with({uuid: uuid})
          expect(resource_factory).to have_received(:create!).with(internal_parameters)
        end

        it 'returns a topic' do
          expect(extension_resource_factory).to receive(:create!).with({uuid: uuid})
          expect(resource_factory).to receive(:create!).with(internal_parameters).and_return(topic)
          expect(service.call).to eq topic
        end
      end
    end
  end
end
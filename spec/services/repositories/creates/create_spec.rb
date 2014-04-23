require 'services_spec_helper'

module Repositories
  module Creates
    describe Create do
      subject(:service) { Create.new(parameters) }
      let(:parameters) { {} }

      describe '#default_resource_factory' do
        it 'raises an error requesting override' do
          expect{ service.resource_factory }.to raise_error('No Default Factory: Please Override')
        end
      end
    end
  end
end
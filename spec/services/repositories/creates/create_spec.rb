require 'fast_spec_helper'
Require.me(__FILE__)

module Repositories
  module Creates
    describe Create do
      subject(:service) { Create.new(parameters) }
      let(:parameters) { {} }

      describe '#resource_factory' do
        it 'raises an error requesting override' do
          expect{ service.resource_factory }.to raise_error('No Default Factory: Please Override')
        end
      end
    end
  end
end
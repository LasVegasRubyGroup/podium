require 'services_spec_helper'

module Crud
  describe Read do
    subject(:service) { Read.new(filters) }
    let(:filters) { {} }

    describe '#default_resource_collection' do
      it 'raises an error requesting override' do
        expect{ service.resource_collection }.to raise_error('No Default Collection: Please Override')
      end
    end
  end
end
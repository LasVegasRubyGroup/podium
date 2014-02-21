require 'fast_spec_helper'
require File.join(SERVICES_ROOT, '/repositories/reads/read.rb')

module Repositories
  module Reads
    describe Read do
      subject(:service) { Read.new(filters) }
      let(:filters) { {} }

      describe '#resource_collection' do
        it 'raises an error requesting override' do
          expect{ service.resource_collection }.to raise_error('No Default Collection: Please Override')
        end
      end
    end
  end
end
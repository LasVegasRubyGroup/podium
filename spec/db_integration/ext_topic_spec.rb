require 'db_integration_spec_helper'

describe ExtTopic do

  it "has the right base class" do
    expect(ExtTopic.atomic_record_base).to eq('Topic')
  end

  it 'returns the count of topic extensions (versions)' do
    expect(ExtTopic.count).not_to be_nil
  end

end
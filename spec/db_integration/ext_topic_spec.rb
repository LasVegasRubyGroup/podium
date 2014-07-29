require 'db_integration_spec_helper'

describe ExtTopic do

  it "has the right base class" do
    expect(ExtTopic.atomic_record_base).to eq('Topic')
  end

  it 'returns the count of topic extensions (versions)' do
    expect(ExtTopic.count).not_to be_nil
  end

  context "when the logical record is updated" do

    let(:topic) {Crud::Topics::Create.new(params).call}
    let(:updated_topic) { Crud::Topics::Update.new(topic, params).call }
    let(:updated_ext_topic) { updated_topic.data }
    let(:params) {{}}

    it "reports 'created' as creation time of the original record" do
      original_creation_time = topic.created_at
      expect(updated_ext_topic.created).to eq(original_creation_time)
    end

    it "reports 'updated' as creation time of the update record" do
      original_creation_time = topic.created_at
      expect(updated_ext_topic.updated).to be > original_creation_time
      expect(updated_ext_topic.updated).to eq(updated_ext_topic.created_at)
    end

  end

end
require 'models_spec_helper'

describe Topic do

  it 'has the right extension class' do
    expect(Topic.atomic_record_extension).to eq("ExtTopic")
  end

  it 'has the right extension table' do
    expect(Topic.extension_table).to eq("ext_topics")
  end

  it 'returns the count of topics' do
    expect(Topic.count).not_to be_nil
  end

  context 'CRUD' do

    subject(:topic) {Crud::Topics::Create.new(params).call}
    let(:params) {{}}

    describe 'create' do

      context 'default parameters' do
      
        it 'creates a record in the topics table' do
          n = Topic.count
          topic
          expect(Topic.count).to eq(n+1)
        end

        it 'creates a record in the ext_topics tables' do
          n = ExtTopic.count
          topic    
          expect(ExtTopic.count).to eq(n+1)
        end

      end

      context 'with parameters' do

        let(:params) {{title: "My Talk", description: "awesome"}}

        it 'provides direct access to its extended attributes' do
          expect(topic.title).to eq("My Talk")
          expect(topic.description).to eq("awesome")
        end

        it 'has an array of versions' 

        it 'has returns a history for a specific row identified by uuid'

        it 'returns the history for all rows, sorted by uuid and ordered by ext_id'

      end

    end

    describe 'update' do

      let(:new_title) {"new title"}
      let(:new_description) {"new description"}
      let(:update_params) {{title: new_title, description: new_description}}
      let(:updated_topic) { Crud::Topics::Update.new(topic, update_params).call }

      it 'creates a new record in the ext_topics table' do
        n = ExtTopic.count
        updated_topic
        expect(ExtTopic.count).to eq(n+2)
      end

      it 'does not create a new record in the topics table' do
        n = Topic.count
        updated_topic
        expect(Topic.count).to eq(n+1)   
      end

      it 'has the new title and description' do
        expect(updated_topic.title).to eq("new title")
        expect(updated_topic.description).to eq("new description")
      end

      it "reports 'created' as creation time of the original record" do
        original_time = topic.created_at
        expect(updated_topic.created).to eq(original_time)
      end

      it "reports 'updated' as creation time of the updated record" do
        original_time = topic.created_at
        expect(updated_topic.updated).to be > original_time
        expect(updated_topic.updated).to eq(updated_topic.data.created_at)
      end

    end

  end

end

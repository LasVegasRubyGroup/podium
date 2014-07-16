class CreateBaseTopics < ActiveRecord::Migration
  def change
    create_table :base_topics, id: false do |t|
      t.integer :topic_id, null: false
      t.string :uuid, null: false
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
    add_index :base_topics, :topic_id, unique: true
    add_index :base_topics, :uuid, unique: true
  end
end

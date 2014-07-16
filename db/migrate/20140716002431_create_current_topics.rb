class CreateCurrentTopics < ActiveRecord::Migration
  def change
    create_table :current_topics do |t|
      t.integer :topic_id, null: false
      t.string :uuid, null: false
      t.boolean :deleted, null: false, default: false

      t.timestamps
    end
    add_index :current_topics, :topic_id, unique: true
    add_index :current_topics, :uuid, unique: true
  end
end

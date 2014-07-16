class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics, id: false do |t|
      t.integer :topic_id, null: false
      t.string :uuid, null: false
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
    create_table :ext_topics do |t|
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''

      t.string :uuid, null: false
      t.timestamps
    end
    add_index :topics, :topic_id, unique: true
    add_index :topics, :uuid, unique: true
    add_index :ext_topics, :uuid, unique: true  
  end
end

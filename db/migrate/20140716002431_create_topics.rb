class CreateTopics < ActiveRecord::Migration
  def change

    create_table :topics, id: false do |t|
      t.integer :ext_id, null: false
      t.string :uuid, null: false   # declared as Primary Key in model class
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
    add_index :topics, :ext_id, unique: true
    add_index :topics, :uuid, unique: true

    create_table :ext_topics do |t|
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''

      t.string :uuid, null: false
      t.timestamps
    end
    add_index :ext_topics, :uuid

  end
end

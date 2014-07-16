class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title, null: false, default: ''
      t.text :description, null: false, default: ''

      t.string :uuid
      t.boolean :deleted, null: false, default: false
      t.timestamps
    end
    add_index :topics, :uuid, unique: true
  end
end

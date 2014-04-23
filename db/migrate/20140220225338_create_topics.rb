class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :description

      t.string :uuid
      t.boolean :deleted, default: false
      t.timestamps
    end
    add_index :topics, :uuid
  end
end

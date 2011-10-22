class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :url
      t.string :description
      t.integer :user_id
      t.integer :points, :default => 0

      t.timestamps
    end
    add_index :links, :user_id
  end

  def self.down
    drop_table :links
  end
end

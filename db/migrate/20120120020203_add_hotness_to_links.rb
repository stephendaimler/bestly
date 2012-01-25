class AddHotnessToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :hotness, :float
  
    add_index :links, :hotness
  end
  
  def self.down
    remove_column :links, :hotness
  end
end

class AddPosterToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :poster, :boolean, :default => false
  end

  def self.down
    remove_column :users, :poster
  end
end

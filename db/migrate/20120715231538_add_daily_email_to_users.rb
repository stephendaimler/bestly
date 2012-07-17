class AddDailyEmailToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :daily_email, :boolean, :default => false
  end

  def self.down
    remove_column :users, :daily_email
  end
end

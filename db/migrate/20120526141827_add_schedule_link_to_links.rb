class AddScheduleLinkToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :schedule_link, :boolean
    add_column :links, :post_link_at, :datetime
    add_column :links, :link_posted, :boolean
  end

  def self.down
    remove_column :links, :schedule_link
    remove_column :links, :post_link_at
    remove_column :links, :link_posted
  end
end

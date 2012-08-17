class ChangeScheduleLinks < ActiveRecord::Migration
  def change
    change_column :links, :schedule_link, :boolean, :default => false
    change_column :links, :link_posted, :boolean, :default => false
  end
end

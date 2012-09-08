class Link < ActiveRecord::Base
  attr_accessible :description, :url, :schedule_link, :post_link_at, :link_posted, :hotness
  
  belongs_to :user
  
  validates :description, :presence => true, :length => { :maximum => 80 }
  validates :url, :presence => true
  validates :user_id, :presence => true
  
  acts_as_voteable
  
  scope :sorted_by_time, :order => 'links.created_at DESC'
  
  scope :sorted_by_hotness, :order => 'links.hotness DESC'
  
  scope :link_posted, where(:link_posted => true)
  scope :link_not_posted, where(:link_posted => false)
  
  def update_hotness!
    self.hotness = hotness_score
    self.save
  end
  
  def hotness_score
    gravity = 1.8
    age_in_hours = ((Time.now - self.created_at)/3600).round
    (self.plusminus - 1) / (age_in_hours+2) ** gravity
  end
  
  def deliver_link
    if Time.zone.now >= post_link_at
    update_attributes :link_posted => true
    end
  end
end

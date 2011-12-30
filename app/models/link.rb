class Link < ActiveRecord::Base
  attr_accessible :description, :url
  
  belongs_to :user
  
  validates :description, :presence => true, :length => { :maximum => 100 }
  validates :url, :presence => true
  validates :user_id, :presence => true
  
  acts_as_voteable
  
  default_scope :order => 'links.created_at DESC'
  
  scope :hotness2, :order => 'hotness_column_name_here DESC'
  
  def hotness
    gravity = 1.8
    age_in_hours = ((Time.now - self.created_at)/3600).round
    (self.plusminus - 1) / (age_in_hours+2) ** gravity
  end
end

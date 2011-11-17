class Link < ActiveRecord::Base
  attr_accessible :description, :url
  
  belongs_to :user
  
  validates :description, :presence => true, :length => { :maximum => 100 }
  validates :url, :presence => true
  validates :user_id, :presence => true
  
  acts_as_voteable
  
  default_scope :order => 'links.created_at DESC'
end

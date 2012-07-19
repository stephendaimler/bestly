class User < ActiveRecord::Base
  # Include default devise modules. Others available are:key => "value", 
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :daily_email
  
  has_many :links, :dependent => :destroy
  
  validates :username, :uniqueness => { :case_sensitive => false }, :length => { :maximum => 15 }
  
  acts_as_voter
  has_karma(:links, :as => :user)
  
  scope :poster, where(:poster => true)
  scope :by_username, lambda{|u|
    where("lower(username) = lower(?)", u)
  }
  scope :by_email, lambda{|u|
    where("lower(email) = lower(?)", u)
  }
end

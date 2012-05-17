class User < ActiveRecord::Base
  # Include default devise modules. Others available are:key => "value", 
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  
  has_many :links, :dependent => :destroy
  
  validates :username, :uniqueness => { :case_sensitive => false }
  
  acts_as_voter
  has_karma(:links, :as => :user)
  
  def self.send_daily_email
      user = User.all
      UserMailer.daily_deals(user).deliver
    end
  end  
end

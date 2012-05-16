class UserMailer < ActionMailer::Base
  default :from => "stephen@byodeal.com"
  
  def registration_confirmation(user)
    @user = user
    attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{user.username} <#{user.email}>", :subject => "Registered")
  end
  
  def daily_deals(user)
    @user = user
    @links = Link.sorted_by_hotness[1..15]
    mail(:to => "#{user.username} <#{user.email}>", :subject => "byodeal top travel deals")
  end
end

#UserMailer.registration_confirmable(@user).deliver
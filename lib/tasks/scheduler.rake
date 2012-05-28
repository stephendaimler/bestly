desc "send daily email"
task :daily_email => :environment do
  User.each do |user|
    UserMailer.daily_deals(user).deliver
  end
end

desc "post scheduled links"
task :hourly_post_links => :environment do
  Link.deliver_link
  end
end
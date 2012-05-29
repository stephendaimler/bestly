desc "send daily email"
task :daily_email => :environment do
  User.all.each do |user|
    UserMailer.daily_deals(user).deliver
  end
end

desc "post scheduled links"
task :hourly_post_links => :environment do
  Link.link_not_posted.each do |link|
    link.deliver_link
  end
end
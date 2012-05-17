desc "run daily tasks"
task :daily => :environment do
 User.all_users_to_notify.each do |user|
   UserMailer.daily_deals(user).deliver
 end
end
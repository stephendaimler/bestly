namespace :daily do
  desc "run daily tasks"
  task :daily => :environment do
   User.each do |user|
     UserMailer.daily_deals(@user).deliver
   end
  end
end
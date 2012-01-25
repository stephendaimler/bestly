namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:username => "Example User",
                         :email => "example@railstutorial.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      username  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:username => username,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    
    50.times do
      User.all(:limit => 6).each do |user|
        link = user.links.create!(:description => Faker::Lorem.sentence(5), :url => "http://www.google.com")
        user.vote_for(link)
      end
    end
  end
end
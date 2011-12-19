namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:username => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
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
        user.links.create!(:description => Faker::Lorem.sentence(5), :url => "http://www.google.com")
      end
    end
  end
end
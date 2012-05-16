ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'byodeal.com',
  :user_name            => 'stephen@byodeal.com',
  :password             => 'byod4life',
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
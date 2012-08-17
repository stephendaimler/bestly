# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Bestly::Application

if Rails.env == "production"  
   require 'rack/rewrite'
   use Rack::Rewrite do
      r301 /.*/, Proc.new {|path, rack_env| "http://www.#{rack_env['SERVER_NAME']}#{path}" }, :if => Proc.new { |rack_env| ! (rack_env['SERVER_NAME'] =~ /www\./i) }
  end
end
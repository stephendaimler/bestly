Bestly::Application.config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do
    r301 %r{.*}, 'http://www.byodeal.com$&', :if => Proc.new {|rack_env|
    rack_env['SERVER_NAME'] != 'www.byodeal.com'
    }
end if Rails.env == 'production'
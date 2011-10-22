# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.username              "ExampleUser"
  user.email                 "user@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :link do |link|
  link.description "Foo bar"
  link.url "Foo bar"
  link.association :user
end
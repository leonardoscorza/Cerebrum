source 'https://rubygems.org'

gem 'mongo'
gem 'mongo_ext'
gem 'redis'
gem 'bson_ext'
gem 'rest-client'
gem 'hpricot'
gem 'pry'
gem 'byebug'
gem 'mail'
gem 'rspec'
gem 'logging'


#Add Gems for fundamentals
Dir["./actions/fundamental/*/Gemfile"].each do |gemfile|
	eval(IO.read(gemfile), binding)
end

#Add Gems for extensions
Dir["./actions/extensions/*/Gemfile"].each do |gemfile|
	eval(IO.read(gemfile), binding)
end
require 'twitter'

$client = Twitter::REST::Client.new do |config|
		  	config.consumer_key        = "Lou7nrM4B7IKdmf79dMemsHFt"
		  	config.consumer_secret     = "ZUbh8S9B9uFb1r8lYsjMvtYoYGcMmLVFdkzTvTbNtI6pvRa31b"
		  	config.access_token        = "2376188359-SkM8AFEVHgsjVg1zzqcFhnTNmje7rmaksw5L06Y"
		  	config.access_token_secret = "e8mJiRGLww4n2FL0bg4OMyxRj8dLRwWYJX6db5N5VY4uk"
end

# client.search("to:justinbieber marry me", result_type: "recent").take(3).collect do |tweet|
#   "#{tweet.user.screen_name}: #{tweet.text}"
# end

# $client.search("#{ARGV.join(' ')}", result_type: "recent")

# $client.search("#{ARGV.join(' ')}", result_type: "recent").to_h[:statuses]
# search = $client.search("#{ARGV.join(' ')}", result_type: "recent")

# search.to_h[:statuses].each do |s|
	
# end
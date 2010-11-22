consumer_key = configatron.twitter.consumer_key
consumer_secret = configatron.twitter.consumer_secret

unless !consumer_key.nil? && !consumer_secret.nil?
  raise 'Twitter API settings is not found. Add config/config.yml OR ENV["TWITTER_CONSUMER_KEY"] and ENV["TWITTER_CONSUMER_SECRET"]'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, consumer_key, consumer_secret
end

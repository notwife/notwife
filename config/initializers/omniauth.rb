consumer_key = configatron.twitter.consumer_key.blank? ? ENV['TWITTER_CONSUMER_KEY'] : configatron.twitter.consumer_key
consumer_secret = configatron.twitter.consumer_secret.blank? ? ENV['TWITTER_CONSUMER_SECRET'] : configatron.twitter.consumer_secret

raise 'Twitter API settings is not found. Add config/config.yml OR ENV["TWITTER_CONSUMER_KEY"] and ENV["TWITTER_CONSUMER_SECRET"]' unless !consumer_key.nil? && !consumer_secret.nil?

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, consumer_key, consumer_secret
end

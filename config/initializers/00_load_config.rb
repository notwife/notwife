configatron.configure_from_yaml("config/config.yml", :hash => Rails.env)

if configatron.twitter.consumer_key.nil?
  configatron.twitter.consumer_key = ENV['TWITTER_CONSUMER_KEY']
end
if configatron.twitter.consumer_secret.nil?
  configatron.twitter.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
end
if configatron.notifo.username.nil?
  configatron.notifo.username = ENV['NOTIFO_USERNAME']
end
if configatron.notifo.secret.nil?
  configatron.notifo.secret = ENV['NOTIFO_SECRET']
end
if configatron.husband.url.nil?
  configatron.husband.url = ENV['HUSBAND_URL']
end
if configatron.husband.keyword.nil?
  configatron.husband.keyword = ENV['HUSBAND_KEYWORD']
end

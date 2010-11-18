username = configatron.notifo.api_username
username = username.blank? ? ENV['NOTIFO_USERNAME'] : username
secret   = configatron.notifo.api_secret
secret   = secret.blank? ? ENV['NOTIFO_SECRET'] : secret

unless !username.nil? && !secret.nil?
  raise 'Notifo API settings is not found. Add config/config.yml OR ENV["NOTIFO_USERNAME"] and ENV["NOTIFO_SECRET"]'
end

$notifo = Notifo.new(username,secret)

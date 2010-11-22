username = configatron.notifo.username
secret   = configatron.notifo.secret

unless !username.blank? && !secret.blank?
  raise 'Notifo API settings is not found. Add config/config.yml OR ENV["NOTIFO_USERNAME"] and ENV["NOTIFO_SECRET"]'
end

$notifo = Notifo.new(username,secret)

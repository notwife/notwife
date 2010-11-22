desc 'Set ENV on heroku'
task :setenv do
  configatron.configure_from_yaml("config/config.yml")

  username = configatron.development.notifo.api_username
  secret   = configatron.development.notifo.api_secret

  system('heroku', 'config:add', 'NOTIFO_USERNAME=' + username)
  system('heroku', 'config:add', 'NOTIFO_SECRET='   + secret)
end
